Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A619E754CB
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD606E7B4;
	Thu, 25 Jul 2019 16:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6466E7AB
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:13 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s22so36983032qkj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F0bGZPxeDHCUtvAprwMG4euYm1HE+AtVDGuwqnEGNlI=;
 b=r7LQM9TeoNvTqCQiO4BC+gU79hGmgSnN609ELyBHmB98rb8+d6VAjN0ZJCLZ9KEV9h
 ioN17Nz5uqBTow+ft6clXGuE67Cum+Oi5KXWm4HYdeI71/aOoMJw27/61CscCj+NOVzm
 C8hJDAs9qlvKnga0HHS8xujNwOfZRwoV4qZaHCl1XWnYH6tZA9EkLe5RMnELTjXbyiEU
 NjYRqY7DoV1nALzgjyIcViFE2xvVrVvGrcb9d5QLsHkws1FRWRCJ5LBIrzJXcb7T7QoZ
 UlrSnLGo/yIzYOWep5DVVstyHb5TBwJRapyh9PSEuqHnVa7SOBtcECfu08HM0ruQxGkp
 Q9rA==
X-Gm-Message-State: APjAAAWdlDbYB0htpY6wBBq7Q+4Frcp2leeHilalkxE+xi61E1HLon9I
 KYLYwKPQErpmlE8403jgbn2M/6Kb
X-Google-Smtp-Source: APXvYqylXdacBnRrXlTMqa281np2jE08GA29wF9g8i8P5RGu2gY/7jiCfNit/VcGKKBAqXDRt843ow==
X-Received: by 2002:a37:a14e:: with SMTP id k75mr60571012qke.65.1564073891957; 
 Thu, 25 Jul 2019 09:58:11 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/12] drm/amdgpu/powerplay: add set_mp1_state for vega10
Date: Thu, 25 Jul 2019 11:57:55 -0500
Message-Id: <20190725165758.16928-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F0bGZPxeDHCUtvAprwMG4euYm1HE+AtVDGuwqnEGNlI=;
 b=fEQJLYLwU8XBEhnp+WCWmYhrHEPpIITjJZLOOW2V42RbcFuaSkUVJPCnOh2HrxmEjj
 LXQxLmcpLxrkRy1FPme52/Xl1/505MGti4B/ZqcJbHli1uUus7LVxBWDNAjUXZ/iHndp
 4MrOhZTNV+NJ4p/I6EKIJgenm9NgLpUOfXF7PZM+xOkBJLV6LAMCCEZH4rj1+ljJjSmC
 q6E3KVv+b+w2A07bcGKi2yZ4A+SaKXJkM0cTPoBq6xCJ5rRXxayorfoTrGMAINf8lEyL
 wAAlUeuVkorWIloNlUtmfizrEp9Z7W61YQruYRKXYjuB9Mp+XUBXNb6Ga80ywnHFJ924
 HCEA==
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
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jICAgIHwgMjUgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCmluZGV4IDFkOWJiMjlh
ZGFlZi4uMDNiZDYyZTNkOTQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwpAQCAtNTIxOCw2ICs1MjE4LDMwIEBAIHN0YXRpYyBp
bnQgdmVnYTEwX29kbl9lZGl0X2RwbV90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAogCXJl
dHVybiAwOwogfQogCitzdGF0aWMgaW50IHZlZ2ExMF9zZXRfbXAxX3N0YXRlKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IsCisJCQkJZW51bSBwcF9tcDFfc3RhdGUgbXAxX3N0YXRlKQoreworCXVpbnQx
Nl90IG1zZzsKKwlpbnQgcmV0OworCisJc3dpdGNoIChtcDFfc3RhdGUpIHsKKwljYXNlIFBQX01Q
MV9TVEFURV9VTkxPQUQ6CisJCW1zZyA9IFBQU01DX01TR19QcmVwYXJlTXAxRm9yVW5sb2FkOwor
CQlicmVhazsKKwljYXNlIFBQX01QMV9TVEFURV9TSFVURE9XTjoKKwljYXNlIFBQX01QMV9TVEFU
RV9SRVNFVDoKKwljYXNlIFBQX01QMV9TVEFURV9OT05FOgorCWRlZmF1bHQ6CisJCXJldHVybiAw
OworCX0KKworCVBQX0FTU0VSVF9XSVRIX0NPREUoKHJldCA9IHNtdW1fc2VuZF9tc2dfdG9fc21j
KGh3bWdyLCBtc2cpKSA9PSAwLAorCQkJICAgICJbUHJlcGFyZU1wMV0gRmFpbGVkISIsCisJCQkg
ICAgcmV0dXJuIHJldCk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCB2ZWdhMTBfZ2V0
X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGNvbnN0IHN0cnVjdCBw
cF9od19wb3dlcl9zdGF0ZSAqc3RhdGUsCiAJCQkJUEhNX1BlcmZvcm1hbmNlTGV2ZWxEZXNpZ25h
dGlvbiBkZXNpZ25hdGlvbiwgdWludDMyX3QgaW5kZXgsCiAJCQkJUEhNX1BlcmZvcm1hbmNlTGV2
ZWwgKmxldmVsKQpAQCAtNTMwNyw2ICs1MzMxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcF9o
d21ncl9mdW5jIHZlZ2ExMF9od21ncl9mdW5jcyA9IHsKIAkuZW5hYmxlX21ncHVfZmFuX2Jvb3N0
ID0gdmVnYTEwX2VuYWJsZV9tZ3B1X2Zhbl9ib29zdCwKIAkuZ2V0X3BwZmVhdHVyZV9zdGF0dXMg
PSB2ZWdhMTBfZ2V0X3BwZmVhdHVyZV9zdGF0dXMsCiAJLnNldF9wcGZlYXR1cmVfc3RhdHVzID0g
dmVnYTEwX3NldF9wcGZlYXR1cmVfc3RhdHVzLAorCS5zZXRfbXAxX3N0YXRlID0gdmVnYTEwX3Nl
dF9tcDFfc3RhdGUsCiB9OwogCiBpbnQgdmVnYTEwX2h3bWdyX2luaXQoc3RydWN0IHBwX2h3bWdy
ICpod21ncikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
