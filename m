Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04CD3752
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A993E6EBA6;
	Fri, 11 Oct 2019 01:46:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62296EB9D
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:46:06 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u22so7442784qkk.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWb7kWQAUqdaSlb5jPdaLGWNXCeObBUPctANytuEjow=;
 b=NPiD0GlAJpwaHdJjKkZbcRnuyo1r45LcPRxU+y2yp0ctz1VWgNYbJBjqlh8jsLRcKc
 +SwjIia5yjblhaIn5k1jbyU8zYVtDdStt7zi2BpM+Nlz7Mr6z1nbUK/74AtvVGmTtWlH
 AxvMrsbTa01LOlRT46S4dAjV2bTkSu0QfnQRl7M29oL3vSXtB1B5ESMPOPDx3qSYVym6
 Kc7ATzjwxBrXKU7xibCzkzu8A4em46w8MnO+225w2NUYkQVK59GOFWABt4oCVJEiMLDW
 seg14fPJOjE2aTO6Uuf1I83P0zfnnxy6Ho6LKIn1LPHmnKQ9oBWnEo+chy0tiR34OdZW
 a5Vw==
X-Gm-Message-State: APjAAAXVLwKcVZ8lHbTVzkrPHALyh6XBccVDT8j8o7LD7Y9Y06j5WYZo
 TK+f90AiEf0YCS4PjkCN4lkCMX1X
X-Google-Smtp-Source: APXvYqxRyP6EHgnBVlqnqRyvMmTy5ZcjBRIKn5wYw/C6hfgV/m2cOTwrC+EQVEtP+Mp+/1DQYunG+A==
X-Received: by 2002:a37:8945:: with SMTP id l66mr12726661qkd.322.1570758365638; 
 Thu, 10 Oct 2019 18:46:05 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:46:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 19/19] ALSA: hda/hdmi - enable automatic runtime pm for AMD
 HDMI codecs by default
Date: Thu, 10 Oct 2019 20:45:36 -0500
Message-Id: <20191011014536.10869-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWb7kWQAUqdaSlb5jPdaLGWNXCeObBUPctANytuEjow=;
 b=fD3OZMRGyndeg61+JPJEFHZ2l0RE45w2yPpjtuSGRtgtfYZ/GYEcE4JJ1TRUYGdd7p
 NhwVg881o/XWG0+zDspJWc3e8Sh6WrXH7MnKWuJeU0+M8/LRIFqpntkF7FPFMdZb/YNV
 PDmv06/iyAtuV3ycYhtPlz4F01gTKHsxqeZVCVZjUSn4WKOFPh8+mtTdzkfgXpROdOkA
 tB7btklES2DCDLKjXcSQ58OTyfVnFSXzWbHur5Q5Fn+GCJGzK6f3x9/HymmtAvdBqQRG
 Ps6AI153WtL2KFwe4COEKMFofffUotPB/bdfGii9UiKiwC+L3OoI8Rz5Aj6VwXK7HTCx
 WEig==
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

U28gdGhhdCB3ZSBjYW4gcG93ZXIgZG93biB0aGUgR1BVIGFuZCBhdWRpbyB0byBzYXZlIHBvd2Vy
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYyBi
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jCmluZGV4IGJlYTdiMDk2MTA4MC4uMjY2MTM3MzNm
MTA5IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYworKysgYi9zb3VuZC9w
Y2kvaGRhL3BhdGNoX2hkbWkuYwpAQCAtMzc3OSw2ICszNzc5LDcgQEAgc3RhdGljIGludCBhdGlo
ZG1pX2luaXQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCQkJCSAgICBBVElfVkVSQl9TRVRf
TVVMVElDSEFOTkVMX01PREUsCiAJCQkJCSAgICBBVElfTVVMVElDSEFOTkVMX01PREVfU0lOR0xF
KTsKIAl9CisJY29kZWMtPmF1dG9fcnVudGltZV9wbSA9IDE7CiAKIAlyZXR1cm4gMDsKIH0KLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
