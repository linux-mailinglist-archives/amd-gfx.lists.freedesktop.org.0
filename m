Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBE712A5
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 09:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4A36E02B;
	Tue, 23 Jul 2019 07:17:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234AE89F33
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 22:31:27 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id j12so20664789pll.14
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 15:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oIv+GpT3Jmjvvs475a+O0pvmLeihB9t3PTRepY2uxPk=;
 b=IroqQyaykd3aA5aBLvtuOPVswyd3bY0+iKVx3uRKdRS9x0C7mc82kYbjc4dNmsrUW/
 metcquUFUcTFLOgc/wpNAcK4SFd1ERwfo3MvkDIbY0Bfdgs3lhGIW5u+wAVETb0hbTrL
 K1ylXYH3x4Da0fFNS6+s98EI5cUKLN2XINx+FqNnYMgARrGEcJZaQKh/LTm13U+MTDz1
 4MU1p+kSZHE4NJuDQ08VoeuA2ci8wHogHte8ge/Aoor5H+NtfVGxldK7KsGzT737sSFT
 FWAj5tD8IITbWzk0DTywW0+3zsXLXhheAGrM6SCc+jByASlafaWAMy6j2iuHJYmjpagM
 Fe2Q==
X-Gm-Message-State: APjAAAW5WqjGh4defdEwvmAwsgcSsSAOgXZzhnZTOD7KtTmHjOOSnRab
 IRPY7MIDY3MzvvQAuOa5/mBeo02yhPEoC0pKd70=
X-Google-Smtp-Source: APXvYqwEcSe4MFck2BfjWshbTKFhQ7S9cI5h/jLdvcYfysTh6s8k/LGX/naPVIWZYigEduLQQu68IgsnYDMugrAbKaw=
X-Received: by 2002:a65:47c1:: with SMTP id f1mr72262210pgs.169.1563834686245; 
 Mon, 22 Jul 2019 15:31:26 -0700 (PDT)
Date: Mon, 22 Jul 2019 15:31:05 -0700
Message-Id: <20190722223112.199769-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
Subject: [PATCH] drm/amd/display: readd -msse2 to prevent Clang from emitting
 libcalls to undefined SW FP routines
From: Nick Desaulniers <ndesaulniers@google.com>
To: alexander.deucher@amd.com, harry.wentland@amd.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:17:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oIv+GpT3Jmjvvs475a+O0pvmLeihB9t3PTRepY2uxPk=;
 b=e9z1PXWshOZDjgKxqCTPRkc0JUjHsmX/IqevVTyDuPiWkRIB+0CYAmRNnmgu7/KqQ6
 8QXqjGXLFmWpWuZy7oguTJcroQBSIcYcP9G95Z7rXaXoOQufl44at826em0QasXPcCAP
 tdsuvy2cj/g/s5hmBR8VOLUfCrDdzZXdMhyAo5ZI7soZ5yJwujP1Ke5+GMFFjd+Lhizc
 27s97VDqPn2Z556kjdN12wQLWPZJgDFFhbzIkQSMuvxcmgNCVys8t/SIDJ00InxZV0RL
 Yc0B3Nb4oKMItoq/l6N5ZSFn3vjZ06AtwsYr8wQoyfGg/bItRNpOtBBp056fivsBekUQ
 tkhg==
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
Cc: David Airlie <airlied@linux.ie>, Nick Desaulniers <ndesaulniers@google.com>,
 dri-devel@lists.freedesktop.org,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 clang-built-linux@googlegroups.com, amd-gfx@lists.freedesktop.org,
 mka@google.com, samitolvanen@google.com, linux@roeck-us.net,
 Arnd Bergmann <arnd@arndb.de>, Charlene Liu <charlene.liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, sedat.dilek@gmail.com, natechancellor@gmail.com,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org, Shirish.S@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, jyknight@google.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YXJjaC94ODYvTWFrZWZpbGUgZGlzYWJsZXMgU1NFIGFuZCBTU0UyIGZvciB0aGUgd2hvbGUga2Vy
bmVsLiAgVGhlCkFNREdQVSBkcml2ZXJzIG1vZGlmaWVkIGluIHRoaXMgcGF0Y2ggcmUtZW5hYmxl
IFNTRSBidXQgbm90IFNTRTIuICBUdXJuCm9uIFNTRTIgdG8gc3VwcG9ydCBlbWl0dGluZyBkb3Vi
bGUgcHJlY2lzaW9uIGZsb2F0aW5nIHBvaW50IGluc3RydWN0aW9ucwpyYXRoZXIgdGhhbiBjYWxs
cyB0byBub24tZXhpc3RlbnQgKHVzdWFsbHkgYXZhaWxhYmxlIGZyb20gZ2NjX3Mgb3IKY29tcGls
ZXJfcnQpIGZsb2F0aW5nIHBvaW50IGhlbHBlciByb3V0aW5lcyBmb3IgQ2xhbmcuCgpUaGlzIHdh
cyBvcmlnaW5hbGx5IGxhbmRlZCBpbjoKY29tbWl0IDEwMTE3NDUwNzM1YyAoImRybS9hbWQvZGlz
cGxheTogYWRkIC1tc3NlMiB0byBwcmV2ZW50IENsYW5nIGZyb20gZW1pdHRpbmcgbGliY2FsbHMg
dG8gdW5kZWZpbmVkIFNXIEZQIHJvdXRpbmVzIikKYnV0IHJldmVydGVkIGluOgpjb21taXQgMTkz
MzkyZWQ5ZjY5ICgiUmV2ZXJ0ICJkcm0vYW1kL2Rpc3BsYXk6IGFkZCAtbXNzZTIgdG8gcHJldmVu
dCBDbGFuZyBmcm9tIGVtaXR0aW5nIGxpYmNhbGxzIHRvIHVuZGVmaW5lZCBTVyBGUCByb3V0aW5l
cyIiKQpkdWUgdG8gYnVncmVwb3J0cyBmcm9tIEdDQyBidWlsZHMuIEFkZCBndWFyZHMgdG8gb25s
eSBkbyBzbyBmb3IgQ2xhbmcuCgpMaW5rOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDk0ODcKTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRM
aW51eC9saW51eC9pc3N1ZXMvMzI3CgpTdWdnZXN0ZWQtYnk6IFNlZGF0IERpbGVrIDxzZWRhdC5k
aWxla0BnbWFpbC5jb20+ClN1Z2dlc3RlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVu
QGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVy
c0Bnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9N
YWtlZmlsZSB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL01h
a2VmaWxlIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL01ha2Vm
aWxlICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZp
bGUgICB8IDQgKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL01ha2VmaWxlIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL01ha2VmaWxlCmluZGV4IDk1ZjMzMmVl
M2U3ZS4uMTY2MTRkNzNhNWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2FsY3MvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NhbGNzL01ha2VmaWxlCkBAIC0zMiw2ICszMiwxMCBAQCBlbmRpZgogCiBjYWxjc19jY2ZsYWdz
IDo9IC1taGFyZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQogCitpZmRlZiBDT05GSUdf
Q0NfSVNfQ0xBTkcKK2NhbGNzX2NjZmxhZ3MgKz0gLW1zc2UyCitlbmRpZgorCiBDRkxBR1NfZGNu
X2NhbGNzLm8gOj0gJChjYWxjc19jY2ZsYWdzKQogQ0ZMQUdTX2Rjbl9jYWxjX2F1dG8ubyA6PSAk
KGNhbGNzX2NjZmxhZ3MpCiBDRkxBR1NfZGNuX2NhbGNfbWF0aC5vIDo9ICQoY2FsY3NfY2NmbGFn
cykgLVduby10YXV0b2xvZ2ljYWwtY29tcGFyZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL01ha2VmaWxlCmluZGV4IGU5NzIxYTkwNjU5Mi4uZjU3YTNiMjgxNDA4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvTWFrZWZpbGUK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL01ha2VmaWxlCkBAIC0x
OCw2ICsxOCwxMCBAQCBlbmRpZgogCiBDRkxBR1NfZGNuMjBfcmVzb3VyY2UubyA6PSAtbWhhcmQt
ZmxvYXQgLW1zc2UgJChjY19zdGFja19hbGlnbikKIAoraWZkZWYgQ09ORklHX0NDX0lTX0NMQU5H
CitDRkxBR1NfZGNuMjBfcmVzb3VyY2UubyArPSAtbXNzZTIKK2VuZGlmCisKIEFNRF9EQUxfRENO
MjAgPSAkKGFkZHByZWZpeCAkKEFNRERBTFBBVEgpL2RjL2RjbjIwLywkKERDTjIwKSkKIAogQU1E
X0RJU1BMQVlfRklMRVMgKz0gJChBTURfREFMX0RDTjIwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUKaW5kZXggMGJiN2EyMDY3NWM0Li4xMzJhZGUxYTIzNGUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9NYWtlZmlsZQpAQCAtMzIs
NiArMzIsMTAgQEAgZW5kaWYKIAogZG1sX2NjZmxhZ3MgOj0gLW1oYXJkLWZsb2F0IC1tc3NlICQo
Y2Nfc3RhY2tfYWxpZ24pCiAKK2lmZGVmIENPTkZJR19DQ19JU19DTEFORworZG1sX2NjZmxhZ3Mg
Kz0gLW1zc2UyCitlbmRpZgorCiBDRkxBR1NfZGlzcGxheV9tb2RlX2xpYi5vIDo9ICQoZG1sX2Nj
ZmxhZ3MpCiAKIGlmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZpbGUKaW5kZXggZTAxOWNkOTQ0N2U4Li4xN2RiNjAz
ZjJkMWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFr
ZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZQpA
QCAtOSw2ICs5LDEwIEBAIGVuZGlmCiAKIGRzY19jY2ZsYWdzIDo9IC1taGFyZC1mbG9hdCAtbXNz
ZSAkKGNjX3N0YWNrX2FsaWduKQogCitpZmRlZiBDT05GSUdfQ0NfSVNfQ0xBTkcKK2RzY19jY2Zs
YWdzICs9IC1tc3NlMgorZW5kaWYKKwogQ0ZMQUdTX3JjX2NhbGMubyA6PSAkKGRzY19jY2ZsYWdz
KQogQ0ZMQUdTX3JjX2NhbGNfZHBpLm8gOj0gJChkc2NfY2NmbGFncykKIENGTEFHU19jb2RlY19t
YWluX2FtZC5vIDo9ICQoZHNjX2NjZmxhZ3MpCi0tIAoyLjIyLjAuNjU3Lmc5NjBlOTJkMjRmLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
