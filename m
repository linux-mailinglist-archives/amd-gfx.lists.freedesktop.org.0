Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088CA4B85
	for <lists+amd-gfx@lfdr.de>; Sun,  1 Sep 2019 22:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BCC89A86;
	Sun,  1 Sep 2019 20:05:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Sun, 01 Sep 2019 20:05:13 UTC
Received: from mx0-44.i-mecca.net (mx0-44.i-mecca.net [76.74.184.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DFB89A86
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 20:05:12 +0000 (UTC)
Received: from mx0.ehosting.ca (localhost [127.0.0.1])
 by mx0.i-mecca.net (Postfix) with ESMTP id B7B341614E5
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 12:58:24 -0700 (PDT)
Received: from ns14.i-mecca.net (unknown [192.168.1.14])
 by mx0.i-mecca.net (Postfix) with ESMTP id F29B71614B1
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 12:58:23 -0700 (PDT)
X-MES: 1.0
Received: from [192.168.1.76] (d75-155-251-1.bchsia.telus.net [75.155.251.1])
 by ns14.i-mecca.net (Postfix) with ESMTPSA id B976C140B1D
 for <amd-gfx@lists.freedesktop.org>; Sun,  1 Sep 2019 12:58:23 -0700 (PDT)
To: amd-gfx@lists.freedesktop.org
From: Luya Tshimbalanga <luya@fedoraproject.org>
Subject: State of AMD Sensor Fusion HUB Linux driver
Openpgp: preference=signencrypt
Autocrypt: addr=luya@fedoraproject.org; prefer-encrypt=mutual; keydata=
 mQENBE80KckBCADCg3mex8NGgBsSbFwZsgSoeyuvCAgDWojZKDvJFJUCjtkAXXIG3Xs9pL9X
 x3nOLK6/FTudl47gSK9Fp0OHLpDmYaNtgYLx2sS9jEsZK4eDaluy3rVV+QJmLhICn5oflaFN
 x8+hZAVrW6t5cHfoKPfI8lljyBqISLx01cdF1fG71vXsNhiiw1laD1Ys/k3oq3mVYROP7j3O
 y9tq0cPGdlj6VZ9YjuqGnGkKTrzF6LJnyDcDjeAqFafIFdRqtYP2CM8R9uzpVXz2qPIBIZkb
 uSz2b4TUI+jA1UF0JpcXI18/nx4WQievtQjWGhF/md1KFa+EnI+he0Eg3Z6oOEYpeKK5ABEB
 AAG0XEx1eWEgVHNoaW1iYWxhbmdhIChDb250cmlidXRvciBzcGVjaWFsaXplZCBpbiBkZXNp
 Z24gYW5kIHBhY2thZ2luZykgPGx1eWFAZmVkb3JhcHJvamVjdC5vcmc+iQE7BBMBAgAlAhsD
 BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUCTzQsUAIZAQAKCRBeUoF02KJgmpW4CACWN9qu
 iuyfwAEQXlzXiZNOixqyUnxANxGkWcjt7sjtBTE5dKlxMe3pLy6nIu1ko/S1f6qEw2vtL8hY
 syq8L+hFFLT+UShwKNaO9zDFwcn7IU4BN+vgS8gFgo5T8C93v4l9AnqPFhlpRayiKrE9j4oG
 lTXcyMhy2vRVT7K68Th5N1Ar5BlaTgeVyzW6Af8YIk/QnQA1d3GnX3K8T4Qo/rZy0KAjrWFZ
 NdU6jjxv8HCpx7s6+nuf4Ftp0Vj/9XbcYaT+N7r54xlFxgmpjkBQNmwW44Md+UaXUTFICGWP
 ayAzTsdHAXd1yP/0aFJDmvpHz6Q3vQlrLnquwwm3UwRsS3DjuQENBE80KckBCADgBWArvFlK
 rjcywh011r6nezQbHtGbDkTbmFMQrmR0oPrEa8vUdUx2NFL8VwIj9rMyvznhbga/ACdZVEnJ
 8NB5jBmLGdjGX9uTBE6sKzlxMi/noZls09gG29R8V4VOAHez0GcjRA5jl62mfxm2uVY3kbh5
 TSQhBYAQy/8vTfhMDSnBdxriyyWGo9E5Ix2dWMDuk5UW2P2EwokxgfGsV/Oi7of1zLvrBBnd
 8ciTYC7izajbqJzRzDYRfy4zU83N8LAx145gXsagn+nxXX95p+O8SXw01XHImryIMg+yuAVt
 04dSj7vpD1/mdwPFcI/l3KLyOY7+e4ZyYnp3o11YweMXABEBAAGJAR8EGAECAAkFAk80KckC
 GwwACgkQXlKBdNiiYJq6TQf/edJgvv/zX8TusNNm6PsR6NZVF91HbVhUDcdA1JDptme2svKy
 evkxraSDd7yATbNoJFFyMENMqV6tO6GUf0m8KsWqDQMjgQRldNghDBEpn5e3TmeI/4ZUGtw/
 KEm/rcaGSEHpLAVkMB6+BwI+a4F8id/6nSzo9se6NSCMxfLLMfj7ILRR99nvt7vzHgPopWdu
 s98MI8jr7P7I6AXhC5Hs3p61awseQWn/OohySBPftZ9XNv6WrHNwfeCr1BF7+C0K4uzKfzsd
 Ez3JVX6tKWJEuRNM5YiMe/MPUoC+lRJxWI3OTGU1/v35SYjVFmL9iV6U0NlzU2/Wan/UCDus
 xDHSCQ==
Message-ID: <d3b8bb89-fbdc-e0d8-2fba-08d236c0df67@fedoraproject.org>
Date: Sun, 1 Sep 2019 12:58:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-CA
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gdGVhbSwKCldoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGUgQU1EIFNlbnNvciBGdXNpb24g
SFVCIGRyaXZlIG5lZWRlZCBmb3IgdGhlCm1vYmlsZSBSYXZlbiBSaWRnZS9QaWNhc3NvL1Jlbm9p
cgphcyBneXJvc2NvcGU/IExpc3RlZCBmcm9tIGxzcGNpIC1ubjoKCnwwMzowMC43IE5vbi1WR0Eg
dW5jbGFzc2lmaWVkIGRldmljZSBbMDAwMF06IEFkdmFuY2VkIE1pY3JvIERldmljZXMsCkluYy4g
W0FNRF0gUmF2ZW4vUmF2ZW4yL1Jlbm9pciBTZW5zb3IgRnVzaW9uIEh1YiBbMTAyMjoxNWU0XXwK
CgpDdXJyZW50bHksIGNvbnZlcnRpYmxlIGxhcHRvcHMgbGlrZSBIUCBFbnZ5IHgzNjAgbGFjayB0
aGF0IGNhcGFiaWxpdHkuCkl0IHdpbGwgYmUgZ3JlYXQgdG8gZ2V0IGEgZm9sbG93LXVwIGZvciB0
ZXN0aW5nIHB1cnBvc2UuCgoKTHV5YQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
