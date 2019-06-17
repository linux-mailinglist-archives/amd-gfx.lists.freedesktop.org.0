Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6749030
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7F89FF6;
	Mon, 17 Jun 2019 19:47:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93C889FD1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so12250780qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2O0MLiU9PV4DPsx5dB+8xbMdd59IpLDTQ/wxVhdHs8=;
 b=XHR+vzM/ObPyzc0oiU05jEN4JQTFoT5crz3HuVGpsa8SwN99zYTtGiLLbs4Xz9JpY3
 ATiwRw6/cG8Bw9oWaUVTEv1haCn60A/YMisp8qdWBvkoLe2L2GAQS69aTaM1xMiUCbsx
 /TwoRIvoS+mwnLgkOLbOQg1TD/l+XbtPTnAuSzz9j67jz9kkXEJB3ooJj/CbQQ7YRmIN
 BFRTLz40QQ/kNDbtpdqdSUQHyHjEJMzKa5enOispGDQonoexrLqMA1CIdtv/tZ5FYprW
 vdRxss7vWacTsC1DCb5jXf09woY1pMY4JhaDVzB3PwSeYeKKP0/e/ROu7E5MSXDIzD8v
 AhXQ==
X-Gm-Message-State: APjAAAXtZl09Cp+OkZnN+dEH3P/stkJ3JuQRT85kTyuJqv+z0VvAy0Kh
 +j37weKF1aniQTmhBuVQLhXBQFB6sb9Ezw==
X-Google-Smtp-Source: APXvYqzBwec98NmnbPG1UrIOzbH9sIgeoTNL8L+VysQZZZoZNFu0om9kQF+FEOLKZWSgZm9WMThnvw==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr1770870qvh.225.1560800839959; 
 Mon, 17 Jun 2019 12:47:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 384/459] drm/amd/display: Guard DML_FAIL_DSC_VALIDATION_FAILURE
Date: Mon, 17 Jun 2019 14:45:25 -0500
Message-Id: <20190617194540.18497-85-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2O0MLiU9PV4DPsx5dB+8xbMdd59IpLDTQ/wxVhdHs8=;
 b=jHgqnS+51AsPofilVq4f2LPj4THIPoD7FRyoE8A2wSiDRmUbvtCMJBmuLWA/8m8QJ1
 S4X+0ElO9i3pi5duAIAcnO6dfCMGhyvCuS5sJt+D3oVjcPejmEE+M0oFDdq7sqIoE87v
 c+wKNb5KDK9w7Lvu+hxXrX/U46D7MU3qrJUNBiZBeK3FLtg0m/UL5ucqxcHCGO60FgaQ
 mIscOZiXYpEAXhcAZthKdRILOkl4oAsd3zC2SFdiP/XNWf7qaydpmycRpj9lCcZrq7Fw
 Y9xen18wVOrvaaGgyyK4tcAwzg78TGAjrq70Pay3nryuNUTDorUVmuiIeq4v3+C58cU0
 d6pg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpbV2h5XQpVc2FnZSBvZiB0aGlzIGVu
dW0gaXMgRFNDLW9ubHkuCgpbSG93XQpHdWFyZCBpdCB3aXRoIENPTkZJR19EUk1fQU1EX0RDX0RT
Q19TVVBQT1JULgoKU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfZW51bXMuaCB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9lbnVtcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfZW51bXMuaAppbmRleCBl
OGRhMjFmMDQ0NTQuLjJhNjVhZjMxZWFhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfZW51bXMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9lbnVtcy5oCkBAIC0xMzAsNyArMTMw
LDkgQEAgZW51bSBkbV92YWxpZGF0aW9uX3N0YXR1cyB7CiAJRE1MX0ZBSUxfRElPX1NVUFBPUlQs
CiAJRE1MX0ZBSUxfTk9UX0VOT1VHSF9EU0MsCiAJRE1MX0ZBSUxfRFNDX0NMS19SRVFVSVJFRCwK
KyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCURNTF9GQUlMX0RTQ19WQUxJ
REFUSU9OX0ZBSUxVUkUsCisjZW5kaWYKIAlETUxfRkFJTF9VUkdFTlRfTEFURU5DWSwKIAlETUxf
RkFJTF9SRU9SREVSSU5HX0JVRkZFUiwKIAlETUxfRkFJTF9ESVNQQ0xLX0RQUENMSywKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
