#include <cstdint>
#include <filesystem>
#include <functional>
#include <stdexcept>
#include <system_error>
#include <iostream>

int main(int cnt_args, char **args)
{
    std::error_code ec { std::make_error_code(std::errc::no_such_file_or_directory)};

    try 
    {
        if(cnt_args == 1) throw std::logic_error("You need to pass any file for working ...");
    }
    catch(const std::logic_error& er)
    {
        std::cerr << er.what() << '\n';
    }

    for(std::size_t i{1}; i < cnt_args; i++)
    {
        std::uintmax_t file_size {std::filesystem::file_size(args[i], ec)};
        std::cout << '\t' << args[i] << ": ";
        if(!ec) 
            std::cout << file_size << '\n';
        else 
            std::cout << ec.message()<< '\n';
    }
}
