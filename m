Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E890D275A5
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 07:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841A889C53;
	Thu, 23 May 2019 05:41:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Thu, 23 May 2019 05:41:53 UTC
Received: from mx0-35.i-mecca.net (mx0-35.i-mecca.net [76.74.184.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02A789C53
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 05:41:53 +0000 (UTC)
Received: from mx0.ehosting.ca (localhost [127.0.0.1])
 by mx0.i-mecca.net (Postfix) with ESMTP id 4111747579
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 22:34:17 -0700 (PDT)
Received: from ns14.i-mecca.net (unknown [192.168.1.14])
 by mx0.i-mecca.net (Postfix) with ESMTP id 70A87475AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 22:34:16 -0700 (PDT)
X-MES: 1.0
Received: from [10.0.9.242] (unknown [184.69.65.194])
 by ns14.i-mecca.net (Postfix) with ESMTPSA id 27ABE140410
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 22:34:15 -0700 (PDT)
To: amd-gfx@lists.freedesktop.org
From: Luya Tshimbalanga <luya@fedoraproject.org>
Subject: Quick question for the mobile Raven Ridge auto-rotate function
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
Message-ID: <887af196-43f2-558c-452c-eb2e1d6b6ef6@fedoraproject.org>
Date: Wed, 22 May 2019 22:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
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

Ci0tLS0tQkVHSU4gUEdQIFNJR05FRCBNRVNTQUdFLS0tLS0KSGFzaDogU0hBMjU2CgpIZWxsbyB0
ZWFtLAoKVGhhbmsgZm9yIHlvdSBtYWtpbmcgbW9iaWxlIFJhdmVuIFJpZGdlIG5lYXJseSBmdWxs
eSBmdW5jdGlvbmFsIHdpdGggdGhlCm9wZW4gc291cmNlIGRyaXZlciBmb3IgbXVsdGlwbGUgZGV2
aWNlcyBsaWtlIEhQIEVudnkgeDM2MCBSeXplbiAyNTAwdS4KSG93ZXZlciwgbWlzc2luZyBpcyB0
aGUgYWJpbGl0eSB0byBhdXRvLXJvdGF0ZSB0aGUgc2NyZWVuIHdoZW4gc3dpdGNoaW5nCmZyb20g
bGFuZHNjYXBlIHRvIHBvcnRyYWl0IGluIHRhYmxldCBtb2RlLgoKV2hpY2ggY2hhbm5lbCB3aWxs
IGJlIGJldHRlciB0byByZXF1ZXN0IGVuYWJsaW5nIHRoYXQgZnVuY3Rpb24gaW4gb3Blbgpzb3Vy
Y2UgZHJpdmVyPyBTZWUgdGhlIHJlbGF0ZWQgaXNzdWUgYmVsb3c6CgpSZWQgSGF0IGJ1ZyByZXBv
cnQ6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTY1MTg4NgoK
TGludXgga2VybmVsIHJlcG9ydDogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0xOTk3MTUKCkkgd2lsbCBiZSB3aWxsaW5nIHRvIHRlc3Qgc3VjaCBkcml2ZXIgdG8g
cmVwb3J0IHRoZSBmdW5jdGlvbmFsaXR5LgoKClRoYW5rcyBpbiBhZHZhbmNlLAoKTHV5YSBUc2hp
bWJhbGFuZ2EKRmVkb3JhIERlc2lnbiBUZWFtCgotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0t
LQoKaVFFekJBRUJDQUFkRmlFRVd5QitCUXRZaUZ6NEdVTkRYbEtCZE5paVlKb0ZBbHptTU04QUNn
a1FYbEtCZE5paQpZSnEvd0FnQW44aldoelhMTGJCWWp0YWk0ZjBDNHJ3MWNLdDFNRGk0OHFPeGxT
aVBhT3BsZkc4UkxyQ0dWRkwzCmpNZ1JlSGhOL1UzemZ5M1NSQlhhMnpzVHNwZFZLUm54ZXdNeEpI
Sm1TNjUzcHJPQUVWc2ZkNDFiL1hETUlubXAKa0ZDY1RLWHdSOUdsVVlQYlN1ajNwTUxTd3EzT0ht
QmxQam5wTDROTVhsbXJjUTZwc045STk5Mkl0ZzhIRW9oMgozdkdGNXFSZEt1aWRMbnU5eFJOTGNl
TGp2cHZUeUo1ZmhIL1J5NXN5bFg1b0poZFc3V2xSNUhFK1Ntc2d1N2hXCnJWR2dHbDZ5RmRVRUdh
aUZScWhQeHVFcEMwN2k3Vmk1UkVxQitzL1lVZ3pNK1duODZ0YUE0TGQxUjlkTWVaSW0KZzdFSmVP
OGM2UktJSTJNT0tXckt0VHB2dVVnK1JRPT0KPUZ0ZmcKLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0t
LS0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
