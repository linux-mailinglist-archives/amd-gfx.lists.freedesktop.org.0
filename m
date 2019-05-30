Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981F3024E
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 20:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DED6E12D;
	Thu, 30 May 2019 18:52:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642846E3E5;
 Thu, 30 May 2019 18:25:38 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s11so4467312pfm.12;
 Thu, 30 May 2019 11:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Lj5sJkyXzswdfKKQsKOyyjcnCowmI0P42DY17LEeBDI=;
 b=lDzOtfrec8w+YNsIdsfZ0MIfH506rg5SGkH39emdUCrGJzXjhb7h52FVgnJMTH9Ujf
 mw/hOTvoQ0udSRVkob7zDzVQmQDw1T/Zj4wmhf+pRed2MjxgxXEJkAkRf1JnQFj3kJlc
 BqcREw7FJkuzIhimE0HiYW6CJPqGeub+l3kLBEuPWkJxpbxgvqwUsVHxMivIVR1BNmc1
 eVjJCoNjpP1dXFZx285aBujuNwZZ/EEZlnsU5E3u6OSWpEckii1v7zQwOVcWEFJloaW4
 RR9FD9Dfex60T4dDwLcUd4lK5QfPOloASBQUzKampmHX0bkBxFKPOeLHOBsZqkrf1gfD
 L0Hg==
X-Gm-Message-State: APjAAAUcBKayIMqwOy91dDWwCahIGOYBy6sf4NeW8oh1hO+f4VXBWC1k
 pxIFPmXFh3ILWj+gnU4rB2A=
X-Google-Smtp-Source: APXvYqy2EQutgm73jGARD8ECucwV9aFaWJhYHhAIfn80iJdYlyi4qnZUJeJdj655kCVPlJIiYb639Q==
X-Received: by 2002:a05:6a00:43:: with SMTP id
 i3mr5089670pfk.113.1559240738062; 
 Thu, 30 May 2019 11:25:38 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.89.153])
 by smtp.gmail.com with ESMTPSA id n127sm2786600pga.57.2019.05.30.11.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 11:25:37 -0700 (PDT)
Date: Thu, 30 May 2019 23:55:32 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Remove call to memset after dma_alloc_coherent
Message-ID: <20190530182532.GA8370@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 30 May 2019 18:52:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Lj5sJkyXzswdfKKQsKOyyjcnCowmI0P42DY17LEeBDI=;
 b=AB/gDn1oV3/ItKH83SwUe0OJ7ImMOhnavPB5tK3/AgwaY4iZ8QxtKelbDYhKQbfvpp
 QW9S6bHqK/tlh/llsKuxLiyZtF+JkAUuvKFbwe1MQGDdxXRzo4hzCvdzEWSJkb2bEdEm
 kbRUfxuhF5fzN/n7nNX0vasy/A3f95vThuoeCO32FBXNxzlEdaxBHxfdjQu9e7G3JlTG
 +kiEFzsf28+JqisDCE1CH5v4Lw1Jac0BNEmDSZSL+Aphn+dB6xpXtdmzodJ+bbHgOCA0
 psdCiAPbkR4MdgEfve7lvKXXWYVZs0z9KC7x1kDrAaA5/EXCxL9iVeaV2MOqDcX0xF/u
 e5IA==
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

VGhpcyBwYXRjaCBmaXhlcyBiZWxvdyB3YXJuaW5nIHJlcG9ydGVkIGJ5IGNvY2NpY2hlY2sKCi4v
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmM6NjM6MTMtMzE6IFdBUk5JTkc6
CmRtYV9hbGxvY19jb2hlcmVudCB1c2UgaW4gaWggLT4gcmluZyBhbHJlYWR5IHplcm9lcyBvdXQg
bWVtb3J5LCAgc28KbWVtc2V0IGlzIG5vdCBuZWVkZWQKClNpZ25lZC1vZmYtYnk6IEhhcmlwcmFz
YWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMKaW5kZXggOTM0ZGZkYy4u
ZDkyMjE4NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lo
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMKQEAgLTY1LDcg
KzY1LDYgQEAgaW50IGFtZGdwdV9paF9yaW5nX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgsCiAJCWlmIChpaC0+cmluZyA9PSBOVUxMKQog
CQkJcmV0dXJuIC1FTk9NRU07CiAKLQkJbWVtc2V0KCh2b2lkICopaWgtPnJpbmcsIDAsIGloLT5y
aW5nX3NpemUgKyA4KTsKIAkJaWgtPmdwdV9hZGRyID0gZG1hX2FkZHI7CiAJCWloLT53cHRyX2Fk
ZHIgPSBkbWFfYWRkciArIGloLT5yaW5nX3NpemU7CiAJCWloLT53cHRyX2NwdSA9ICZpaC0+cmlu
Z1tpaC0+cmluZ19zaXplIC8gNF07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
