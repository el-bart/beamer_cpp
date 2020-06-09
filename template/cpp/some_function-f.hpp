auto count=42;              /* initial value */
std::string sum;
for(auto i=0; i<count; ++i)     // loop
{
  std::string xyz = "some value";
  xyz += "; counter is @ ";
  xyz += std::to_string(i);
  sum += xyz;
}

std::cout << sum << std::endl;  // output sum
