Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8E7A988
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 15:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626EA6E509;
	Tue, 30 Jul 2019 13:28:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7E96E449
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 08:47:27 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id d17so65514667oth.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 01:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=T1o7fu3OAw1P53/mQOTWu/C/O1RGcXZ3Eq9mBW+w3P8=;
 b=cTvJiibZq91bObMlCrS1E/BY/LiHwElq3eV6gj+/mTm+dbjLVtLHBFKhVhpzd5p7MP
 tJL8p8RZ25rOgjc+jsD8cgNJDa0RMQL1j5uudhpvs+Gi0bgQhDtz2s7QHPTXQVAPgy6P
 KRcwGdaEM5uhSHtzdCFw3F07GR+mO/iCeTNVXfBoYjmarGo1ZL0PaVWz1vA4WKgBNoTl
 OaMMozWKQdSQ363O+NiuZRm3Ch67NADVYo2b8A1GXI1w42LxytfI1a2Z8dNJxbogjCK9
 iN9g+Ox+cMTVz/l/sPinzZdI8CKurrHhhXzwFmMgYeM8z0FBc6WsoQH9LOblZGvuquYJ
 UmoQ==
X-Gm-Message-State: APjAAAV7nVKiPQCA31RiB9IDk10VFAxdG+7gJ6bZtlG2ikZwCX/tKxWY
 ZNYwNGI0f5G1YqG4TJrT90POJKQxg8EUnvl5QKQ=
X-Google-Smtp-Source: APXvYqyOHmwRGYviW4p/gLCXe5prUyC/9YCqeL66g6cl97Io1Zh5c5tDe83X5Rve17TslNqidF7mcUQ2O/x4MRfXjL0=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr59493985otj.275.1564476447157; 
 Tue, 30 Jul 2019 01:47:27 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date: Tue, 30 Jul 2019 16:47:15 +0800
Message-ID: <CANTwqXBS5RohKsRWmfPDVxSEwri=XhuZVAmPAwdJibJODxcobA@mail.gmail.com>
Subject: amdgpf: BUG: NULL pointer dereference and memory leak
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:28:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=T1o7fu3OAw1P53/mQOTWu/C/O1RGcXZ3Eq9mBW+w3P8=;
 b=WlekUOHi8Qhyn6tknUaKdJlUHrPoMahhzQRwoiPup+hMsZ8abMBXkiBf9DzFsDNmzn
 Q3hZ5bzzYaUH9/ULzh6vNX/GE/WGZLRGUlIxWFvQUDEeevScWAztWQ3qprxA+WoWvoGS
 ftfWtLDRDwma9kY4QCthUXSoAh+g2ZCnf7FKpfnEdhHk2UpP1HJwKcM6LIAGuSkOz/qe
 QZE1LvWYiG5Ckw9+Ig0CQAZiN14Vu4Nh4synAedphIrUKhfCjYB8OC+jf2epvSwXLWe9
 PPFiLd/VH1LACLY2H3stkYphVfuvzG2/Ia4/u0aAbY8RhE4LQdKGw/mItV/hESyD/BHX
 Akkg==
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgIGFsbGwsCiAgICAgICAgIFdoaWxlIGFuYWx5emluZyB0aGUgc291cmNlIGNvZGUsIEkgbm90
aWNlIHRoYXQgZnVuY3Rpb24KYW1kZ3B1X2NzX3Byb2Nlc3NfZmVuY2VfZGVwKCkgbWF5IGV4aXN0
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhbmQKbWVtb3J5IGxlYWsgaW4gdGhlIGZvbGxvd2lu
ZyBjb2RlIGZyYWdtZW50czoKCgpmZW5jZSA9IGFtZGdwdV9jdHhfZ2V0X2ZlbmNlKGN0eCwgZW50
aXR5LAogICAgZGVwc1tpXS5oYW5kbGUpOwoKaWYgKGNodW5rLT5jaHVua19pZCA9PSBBTURHUFVf
Q0hVTktfSURfU0NIRURVTEVEX0RFUEVOREVOQ0lFUykgewogICAgICAgIHN0cnVjdCBkcm1fc2No
ZWRfZmVuY2UgKnNfZmVuY2UgPSB0b19kcm1fc2NoZWRfZmVuY2UoZmVuY2UpOwogICAgICAgIHN0
cnVjdCBkbWFfZmVuY2UgKm9sZCA9IGZlbmNlOwoKICAgICAgICBmZW5jZSA9IGRtYV9mZW5jZV9n
ZXQoJnNfZmVuY2UtPnNjaGVkdWxlZCk7CiAgICAgICAgZG1hX2ZlbmNlX3B1dChvbGQpOwp9Cgpp
ZiAoSVNfRVJSKGZlbmNlKSkgewogICAgICAgICByID0gUFRSX0VSUihmZW5jZSk7CiAgICAgICAg
IGFtZGdwdV9jdHhfcHV0KGN0eCk7CiAgICAgICAgIHJldHVybiByOwogIH0gZWxzZSBpZiAoZmVu
Y2UpIHsKICAgICAgICAgIHIgPSBhbWRncHVfc3luY19mZW5jZShwLT5hZGV2LCAmcC0+am9iLT5z
eW5jLCBmZW5jZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRydWUpOwogICAgICAgICAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7CiAgICAgICAgICAgYW1k
Z3B1X2N0eF9wdXQoY3R4KTsKICAgICAgICAgICBpZiAocikKICAgICAgICAgICByZXR1cm4gcjsK
ICAgICAgICAgICB9CgpmdW5jdGlvbiBhbWRncHVfY3R4X2dldF9mZW5jZSBtYXkgcmV0dXJuIE5V
TEwgcG9pbnRlciwgIHdoaWNoIHdpbGwKY2F1c2UgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLiBX
aGF0J3MgbW9yZSwgIElTX0VSUigpIHdvdWxkIG5vdApyZXR1cm4gdHJ1ZSB3aGVuIHBvaW50ZXIg
aXMgTlVMTCwgIHdoaWNoIHdpbGwgY2F1c2UgdGhlIGN0eCByZWZlcmVuY2UKbGVha2VkLgpCdXQg
SSBkb24ndCBrbm93IGhvdyB0byBmaXggaXQsIHNvIHJlcG9ydCBpdCB0byB5b3UgYWxsLgoKQmVz
dCBSZWdhcmRzLgpMaW4gWWkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
