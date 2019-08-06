Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD282CB1
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 09:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F5E6E2F0;
	Tue,  6 Aug 2019 07:25:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 758 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2019 07:17:54 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD16789AC9
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 07:17:54 +0000 (UTC)
Received: from oxbagw03.schlund.de ([172.19.245.13]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQeDw-1hjQQX0VvC-00NkT9 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug
 2019 09:05:15 +0200
Date: Tue, 6 Aug 2019 09:05:13 +0200 (CEST)
From: Martin Babutzka <martin.babutzka@online.de>
To: amd-gfx@lists.freedesktop.org
Message-ID: <428588846.275117.1565075113704@mailbusiness.ionos.de>
Subject: Issues with hibernation and resume
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:uW1lgawtf1jVLId4oG22EMQRx5QI9qBa6z3Ea6zWhznTlt6wln4
 hfcOswUM0YoJ3n/57YGzTl8ixm8BjBrjyA8rBOISzlLXI9Ob6f+ixxaf6SEUXnbasUUuYhE
 PcPZ4MCvqyBDqXd/+Sjz49E9M5GoylSmeyhSKy1jVNv5T2zr9bKeM1F0FUHDpH6CASxXOIx
 K7RoLrXbjQq1htiDa8CZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kTnz8khzq/Y=:/lsgHxAq2NJ8T0yQgeHeJY
 F6dZ9gv+ORCt0/3a3anisHKOMbDSONKk8+zlch44MzjYqDJJkDu6rSBvWTEtW2oDGPmHz33dB
 s26Gf9qQFBPV96DO5GoCjZE1GuFKlXg+bdeo11Vd5sVe5j9UfsTDiraYeeWgb9qLn7nfHV62H
 Gtr7JvBFfShvAarG35JoZa9uQ8j69oJylU8d7HzsVivNw+kkBA24BtKKVuXbu0dFiHHBrDwU6
 Kewa9va6u6g3+slJ8EaLKZP/rJryvpoNdnSiJA/tgDNOvTKoCxgeRZG0ivSp3oo1mncGyLdv8
 fLDBpK6b8fNKruUApznoNIyRj/vNKmGZ0vfwrbFyWQSToDwFLvCM/2VnNaSJr+4yUr9+k3XYQ
 +cuqZvmGdN9NgrIy05RHTkEhId6KVZMCsCzbJAMznu/MFiVzfNCS0FiZxzWXIhpcijfXaxk7b
 uIoC3JoJpNmI7soiiFyBlb/bPc/8Et/yjb0VImPDvLVtbxKjMZqXTYvk3dKNhIlak9PX7qPNO
 XvwHXZDih9KprLdgzcON/O3eHcCu7q2Cm0C5whp9rBglPx0PMNy3sD28Iyzxrg8CQGN7AVLqA
 HLytDn9QEgbR/I6zoLzIQAAzyG8WD9NbUIEWa4eHpNsUlytctMwlgL1kLMNAeeJvY/YodtMGi
 k5jC28swYibS8/EaKZK91AJEihpobGOu8ON1yuOEhH1S7NryRdKoqNJeGOelK9s6KiZqBi12q
 RwCrqMY1suSfFFL9y8nqTqGLmHhYUzP1b8VUwjrxDWTLmjCzh8nRnUh2yA6Ji/KvjFBOGlXyE
 oWrBrDk
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:25:19 +0000
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
Content-Type: multipart/mixed; boundary="===============1888972418=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1888972418==
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html><head>
    <meta charset="UTF-8">
</head><body><p>Dear AMD Developers,</p><p>I am building your amd-staging-drm-next kernels for more than 2 years now and patch this up with the official kernel patches and ubuntu&#39;s sauce patches: <a href="https://github.com/M-Bab/linux-kernel-amdgpu-binaries">https://github.com/M-Bab/linux-kernel-amdgpu-binaries</a><br></p><p>One of the kernel users reports about hibernation problems since quite a while and he gives detailed feedback but I am not a hibernation user and had no time to bisect this. Could you please look into this issue and try to help: </p><p><a href="https://github.com/M-Bab/linux-kernel-amdgpu-binaries/issues/81">https://github.com/M-Bab/linux-kernel-amdgpu-binaries/issues/81</a><br></p><p>Thanks for your great work about open-source linux graphics and keep it up!<br></p><p>Many regards,<br>Martin (M-bab)</p></body></html>
 

--===============1888972418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1888972418==--
