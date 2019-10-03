Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C55CA01F
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1D36E9EB;
	Thu,  3 Oct 2019 14:13:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7A76E9EA
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:13:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o12so3791448qtf.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 07:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHiFnMqItG439S8pEg7kzjsAeRl/GJfKIqJEbqrBhnM=;
 b=RU35sR43OuImaEZ2lCwjTNaShuHe1g2PI3o5Ps18Il/iIWskO1PeHJOn6Ti/RfvpVH
 yguWZqRTmuMi26uecVfEB957/R97sTZUILqrsKAqQ438/fT5eUhpiwNOmCAcb191Qne0
 U2AoKqBKCJSbkg+zI/bYdgpswQiwfl20Z3pxowfJZec6/+2JlIeXjC+/yBZ5M+49xhqI
 nfgh8D7I9EiQnF+2bvXzmAK0kGc/81uFyMBMLhHmf3B5ZnUWriMVeMDHVoo4pHTSxiVD
 F9SndAG9GZKMkZqjsUS9DUFR2EtbDvhg9hj0r+hWs7lJAmY36gtlLnI8kzvVS2wjnogC
 wqmA==
X-Gm-Message-State: APjAAAWJR+x3j+LszsnfqSqUE2sTJLy/7QS9OEHtkNsVPXBUJgKpmP69
 Nq6Itdu6Pgn4GEvPJnX/JJlDwKYK
X-Google-Smtp-Source: APXvYqxiKeJvveB2s1Kpk8U9X4IKudIbRhElUIgBpni4fK/i3r/62oVtt9QKFJnn8vyZ5f21Y5bx9A==
X-Received: by 2002:ac8:3482:: with SMTP id w2mr9927931qtb.379.1570112021889; 
 Thu, 03 Oct 2019 07:13:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w34sm1515790qth.84.2019.10.03.07.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 07:13:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: improve MSI-X handling
Date: Thu,  3 Oct 2019 09:13:25 -0500
Message-Id: <20191003141326.7600-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rHiFnMqItG439S8pEg7kzjsAeRl/GJfKIqJEbqrBhnM=;
 b=SUlFBFtfLPMF7USWkPyV72hraFvaILsS/cHXG4mlq2nuegY3zwgU9Z6Z/CPydkPC+N
 GSmZztSoZD6uPpI0jJhLIoBSv7NJXl+jROz8hkzNeITdF5yKzYPXs/5aO83DcoZX0fAb
 xieCPnc6Ek2iuluF7FK2q0UCS8v/OsxJl960WqeUQj8D3iLdO4tpSwrfCtw1YOuhbBQy
 SkvpQsqdJ+U4kWKLNUUVWAWzCZPdqtVwkdJQtv5DSJFMUlIL4xk5xCN9+CSzcmDFHEnq
 MK3N5wYszKxxpAt/ASkZaA4DspbQC2m4Ijc1Cw6RBtAuSXY9h7nXWDTidpgeCqqXJyll
 zIrw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hlY2sgdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgdmVjdG9ycyBhbmQgZmFsbCBiYWNrIHRvIE1T
SSBpZgp3ZSByZXR1cm4gb3IgZXJyb3Igb3IgMCBNU0ktWCB2ZWN0b3JzLgoKU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKaW5kZXggNTA3NzFiMjc1N2RjLi45OGFhMjhlZGJh
NmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKQEAgLTI0NSwxMSAr
MjQ1LDE5IEBAIGludCBhbWRncHVfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJYWRldi0+aXJxLm1zaV9lbmFibGVkID0gZmFsc2U7CiAKIAlpZiAoYW1kZ3B1X21zaV9vayhh
ZGV2KSkgewotCQlpbnQgbnZlYyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAx
LCBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+cGRldiksCi0JCQkJCVBDSV9JUlFfTVNJIHwgUENJ
X0lSUV9NU0lYKTsKKwkJdW5zaWduZWQgaW50IGZsYWdzOworCQlpbnQgbnZlYyA9IHBjaV9tc2l4
X3ZlY19jb3VudChhZGV2LT5wZGV2KTsKKworCQlpZiAobnZlYyA8PSAwKSB7CisJCQlmbGFncyA9
IFBDSV9JUlFfTVNJOworCQkJbnZlYyA9IDE7CisJCX0gZWxzZSB7CisJCQlmbGFncyA9IFBDSV9J
UlFfTVNJIHwgUENJX0lSUV9NU0lYOworCQl9CisJCW52ZWMgPSBwY2lfYWxsb2NfaXJxX3ZlY3Rv
cnMoYWRldi0+cGRldiwgMSwgbnZlYywgZmxhZ3MpOwogCQlpZiAobnZlYyA+IDApIHsKIAkJCWFk
ZXYtPmlycS5tc2lfZW5hYmxlZCA9IHRydWU7Ci0JCQlkZXZfZGJnKGFkZXYtPmRldiwgImFtZGdw
dTogdXNpbmcgTVNJLlxuIik7CisJCQlkZXZfZGJnKGFkZXYtPmRldiwgImFtZGdwdTogdXNpbmcg
TVNJL01TSS1YLlxuIik7CiAJCX0KIAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
