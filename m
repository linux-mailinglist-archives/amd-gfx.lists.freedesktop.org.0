Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF688754CD
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6486E7AF;
	Thu, 25 Jul 2019 16:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48F6E7AB
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:12 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h18so49767953qtm.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0o/IRL7BLo7fEShFJ3JOCr2Q7GiBjml9HjAE8s+TUA=;
 b=FhawFK48gHEf2ot5ab2dP+ipM2Xw4hxUa7rljdhyeyeGsNlPBd7IRlcwR/LmpZ+y4D
 loJweqbuc4UVOO9XR06Zq33HnODoTgfn8FAjqdFCSAph8y7brpr/6jZP1/8RUIbRb3jN
 jpHIBBifiMa05g55GlWJ/I0SQYKvDVFsh2MpkJWxsbcCIoixdDG1Rt5OYF3nUEGhW7IO
 jQWFuYWyaxWdmhFOcI5Y+2H2uGZiutFjC44jbap+nXVfRVyaAqBFmiQJ7aXocAj61PEL
 gI3sdbntHQ8IbOwVON3Lf5hBFi8KZvGyYc0eZsSnA8xCk5muX3VUq6GmqqAuQv3e6WOJ
 KVXw==
X-Gm-Message-State: APjAAAW+5Dn5bZrDcNwZEkQ0IVSu1CaVraism5aoxyXZ0p9lCixop27r
 ZYoU+NOc7Zh983vhEEacuItOy2TQ
X-Google-Smtp-Source: APXvYqyihUVxE3+dXMQsPame3CB76CgwEbkUc7PiwtDxhc9RTOc/Mt5FXP06a19UCuRDGt8YLJiEuw==
X-Received: by 2002:ac8:6114:: with SMTP id a20mr62890530qtm.283.1564073891146; 
 Thu, 25 Jul 2019 09:58:11 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/12] drm/amdgpu/powerplay: add set_mp1_state for vega20
Date: Thu, 25 Jul 2019 11:57:54 -0500
Message-Id: <20190725165758.16928-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0o/IRL7BLo7fEShFJ3JOCr2Q7GiBjml9HjAE8s+TUA=;
 b=sRDeVC23JHIt3lNydHjLRmCH9Uk9HatKOIcKo7DI4qL2TBOliWGkUHRYHP19nfQuio
 /+c3ot+EwkwvXb44FgRSv2bxHAkB/Jaow8INAA9l8mvvLVD7yKvRUuHbMmcydpsdpBwJ
 4Xx+NlfV6b4lE0c2knipAoEC4UCm0Hqmo18XiTRpAkfKwTGtlbW966knOaraLEJ0iOLO
 NRifvEyNkIU2OcpUBO91qwISxsVXelt/+5d1dPEvRqK1KJywMIVu5Ns2wOSZGMxgvSVH
 OOpGKvhf18peEgSl1IyvegBHWvjoqRU8BpKOUdoJ0NIerdvMBCd3ezCtqaUdbZxz+nDM
 2P0Q==
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

VGhpcyBzZXRzIHRoZSBTTVUgaW50byB0aGUgcHJvcGVyIHN0YXRlIGZvciB2YXJpb3VzCm9wZXJh
dGlvbnMgKHNodXRkb3duLCB1bmxvYWQsIEdQVSByZXNldCwgZXRjLikuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jICAgIHwgMjkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCmluZGV4IGYyN2M2ZmJi
MTkyZS4uMDUxNmMyOTRiMzc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwpAQCAtMzA2Myw2ICszMDYzLDM0IEBAIHN0YXRpYyBp
bnQgdmVnYTIwX29kbl9lZGl0X2RwbV90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCXJl
dHVybiAwOwogfQogCitzdGF0aWMgaW50IHZlZ2EyMF9zZXRfbXAxX3N0YXRlKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IsCisJCQkJZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKQoreworCXVpbnQx
Nl90IG1zZzsKKwlpbnQgcmV0OworCisJc3dpdGNoIChtcDFfc3RhdGUpIHsKKwljYXNlIFBQX01Q
MV9TVEFURV9TSFVURE9XTjoKKwkJbXNnID0gUFBTTUNfTVNHX1ByZXBhcmVNcDFGb3JTaHV0ZG93
bjsKKwkJYnJlYWs7CisJY2FzZSBQUF9NUDFfU1RBVEVfVU5MT0FEOgorCQltc2cgPSBQUFNNQ19N
U0dfUHJlcGFyZU1wMUZvclVubG9hZDsKKwkJYnJlYWs7CisJY2FzZSBQUF9NUDFfU1RBVEVfUkVT
RVQ6CisJCW1zZyA9IFBQU01DX01TR19QcmVwYXJlTXAxRm9yUmVzZXQ7CisJCWJyZWFrOworCWNh
c2UgUFBfTVAxX1NUQVRFX05PTkU6CisJZGVmYXVsdDoKKwkJcmV0dXJuIDA7CisJfQorCisJUFBf
QVNTRVJUX1dJVEhfQ09ERSgocmV0ID0gc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsIG1zZykp
ID09IDAsCisJCQkgICAgIltQcmVwYXJlTXAxXSBGYWlsZWQhIiwKKwkJCSAgICByZXR1cm4gcmV0
KTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfcHBmZWF0dXJlX3N0
YXR1cyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjaGFyICpidWYpCiB7CiAJc3RhdGljIGNvbnN0
IGNoYXIgKnBwZmVhdHVyZV9uYW1lW10gPSB7CkBAIC00MTIzLDYgKzQxNTEsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1bmMgdmVnYTIwX2h3bWdyX2Z1bmNzID0gewogCS5nZXRf
YXNpY19iYWNvX2NhcGFiaWxpdHkgPSB2ZWdhMjBfYmFjb19nZXRfY2FwYWJpbGl0eSwKIAkuZ2V0
X2FzaWNfYmFjb19zdGF0ZSA9IHZlZ2EyMF9iYWNvX2dldF9zdGF0ZSwKIAkuc2V0X2FzaWNfYmFj
b19zdGF0ZSA9IHZlZ2EyMF9iYWNvX3NldF9zdGF0ZSwKKwkuc2V0X21wMV9zdGF0ZSA9IHZlZ2Ey
MF9zZXRfbXAxX3N0YXRlLAogfTsKIAogaW50IHZlZ2EyMF9od21ncl9pbml0KHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
