auto count=42;
std::string sum;
for(auto i=0; i<count; ++i)
{
  std::string xyz = "some value";
  xyz += "; counter is @ ";
  xyz += std::to_string(i);
  sum += xyz;
}

std::cout << sum << std::endl;
