Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB169E40
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3589FDB;
	Mon, 15 Jul 2019 21:25:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E489FCA
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:53 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id z4so17290384qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQU53jXjsH1Pa2OnV6beeKi9M4F/vwyhFtUlJwW4+eE=;
 b=A23fvmyPZUvxpRgboYOCuz6t8p/E9ecAYy35pb3oXYFsK1LIwkgfUbT5ufXNrFj2cp
 buQ3wzarM4+8d06NF2v+yETDqOYl5ahI94HNMNO+LpngXayoniCQPWA4cjaEu+ECgDb4
 5dn4t/BL+4NSB1A3thJRXe+jgZMRlruyfp3iPzSzlpyAg6MWFT7OLqLUcuj8wnSZwbdP
 3GmPmtwSBNAWfY25W6r+PQY+z9eBn3sxaf2RtgjvJ/oAyzmYcBzbXQ44bwToA/9qc8+H
 UnWT7sIlLQSe075BmN+4VksanLy1A2Ecybn8QCxO1AGGQFYNKQGU5NITl7D0UyJWXy5z
 GmuQ==
X-Gm-Message-State: APjAAAWrAAZmABV8vAod3Wbr1fJgEjtGsac7YIUU40F5quWyT7IyxKB6
 oFoIObnmgoaPpCMImvJL3Xx8ao5I
X-Google-Smtp-Source: APXvYqxU0TjtrIOKztPG+o1reE7EvypnZZt1uRyC3e3F3HoRrzD/idkCuAaBhT/s8OBGRTzZMw32sQ==
X-Received: by 2002:ac8:38c5:: with SMTP id g5mr20133301qtc.299.1563225952364; 
 Mon, 15 Jul 2019 14:25:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 075/102] drm/amdgpu/: add clientID for 2nd vcn instance
Date: Mon, 15 Jul 2019 16:24:10 -0500
Message-Id: <20190715212437.31793-73-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQU53jXjsH1Pa2OnV6beeKi9M4F/vwyhFtUlJwW4+eE=;
 b=gh8jOFG4DBkNxyi74q4oPfz6UVjb857W3JXx3jx3jpX4q9eFXlvfx/JTHsuJl0cGmu
 R5bw4WBxOmOTGGH105cpM52WvMd0qljiQneSeATnlfAYiiiKsDMbgTfz8YLdyr+FgzUX
 KeXWO4tHSgukhlSi79x78/PLN6Zs82VA7CxUEn1rT8ezDAAQVtwsVIvKIIu/3EwftVMd
 56u1l22LHpd4b4tPLTK0AJC43f7tPwE8YvZ/BZa4YTgPQ9QxPSXo98H9Ell7rLhu5Eur
 ONcFlVqi/cZBr17m02sPHi634f65SoZFKOqt6l6J92T33rWnTcFMd+1iWq5V29u6gdoB
 /6ZA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCmFkZCBjbGllbnRJRCBmb3IgMm5k
IHZjbiBpbnN0YW5jZSwgcmVtb3ZlIHVudXNlZCBTT0MxNV9JSF9DTElFTlRJRF9TWVNIVUIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPgpSZXZpZXdlZC1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L3NvYzE1X2loX2NsaWVudGlkLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1
ZGUvc29jMTVfaWhfY2xpZW50aWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9zb2Mx
NV9paF9jbGllbnRpZC5oCmluZGV4IDBmMzg2YjJlMWY0Zi4uMTc5NGFkMWZjNGZjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaApAQCAtNDIs
NyArNDIsNiBAQCBlbnVtIHNvYzE1X2loX2NsaWVudGlkIHsKIAlTT0MxNV9JSF9DTElFTlRJRF9T
RTFTSAkJPSAweDBiLAogCVNPQzE1X0lIX0NMSUVOVElEX1NFMlNICQk9IDB4MGMsCiAJU09DMTVf
SUhfQ0xJRU5USURfU0UzU0gJCT0gMHgwZCwKLQlTT0MxNV9JSF9DTElFTlRJRF9TWVNIVUIJPSAw
eDBlLAogCVNPQzE1X0lIX0NMSUVOVElEX1VWRDEJCT0gMHgwZSwKIAlTT0MxNV9JSF9DTElFTlRJ
RF9USE0JCT0gMHgwZiwKIAlTT0MxNV9JSF9DTElFTlRJRF9VVkQJCT0gMHgxMCwKQEAgLTY0LDYg
KzYzLDcgQEAgZW51bSBzb2MxNV9paF9jbGllbnRpZCB7CiAJU09DMTVfSUhfQ0xJRU5USURfTUFY
LAogCiAJU09DMTVfSUhfQ0xJRU5USURfVkNOCQk9IFNPQzE1X0lIX0NMSUVOVElEX1VWRCwKKwlT
T0MxNV9JSF9DTElFTlRJRF9WQ04xCQk9IFNPQzE1X0lIX0NMSUVOVElEX1VWRDEsCiAJU09DMTVf
SUhfQ0xJRU5USURfU0RNQTIJCT0gU09DMTVfSUhfQ0xJRU5USURfQUNQLAogCVNPQzE1X0lIX0NM
SUVOVElEX1NETUEzCQk9IFNPQzE1X0lIX0NMSUVOVElEX0RDRSwKIAlTT0MxNV9JSF9DTElFTlRJ
RF9TRE1BNAkJPSBTT0MxNV9JSF9DTElFTlRJRF9JU1AsCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
