Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511197E43C
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFB06E80A;
	Thu,  1 Aug 2019 20:30:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1E6E807
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so71621606qtn.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frKR9y9FvwecBwARV0RO1s/nvGsvBy8jfXR1nphzQko=;
 b=CLGtboK9JN0gqbNs20w5K6fhkxjaVWSLJf+sCp3/lWT+gJKPFXGZcaQSFvkNv4iKg7
 8x37jPSlTGyfWwLveR5J7TPjejm7lnbWVwVeZFsT6ymEju0vTqd8I7A84Q1AjkaIc+3F
 FEaOVpxyQaoKrG0P/em0zXBlJCM9nfgKpfehV2ATYS1EVsJPfB0GIUyKyGkPDUkknIoa
 d7PnvewgFZBtRkKhB2MVvDbhkZsxKO6wQRfRhv8j/SgJz9bYnwOrFnDEZtGu0B/Udb/P
 RKncOwSpLMxFMnAhTauXES/j3H1+zOpod0CvLsURyKllC+MjqIZsgF9trv2IuEVz7bBf
 T25w==
X-Gm-Message-State: APjAAAUqtnK7d0oB/4Semlt4p6snZGFw16ZpRzr/xYkcJgnpjTgZSwT1
 +3YMWvqTbM4Qd+UedVFk47cAXEQT
X-Google-Smtp-Source: APXvYqxWdmYvW3qgmfvwdNBKppxh0UBKjGXAlahEb6AvmmB0/EIrY/FCClOV4i1h16xLz6/u8OjtEg==
X-Received: by 2002:a0c:b163:: with SMTP id r32mr95565018qvc.169.1564691437384; 
 Thu, 01 Aug 2019 13:30:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 36/36] drm/amdgpu: enable Navi12 kfd support for amdgpu
Date: Thu,  1 Aug 2019 15:29:57 -0500
Message-Id: <20190801202957.29791-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frKR9y9FvwecBwARV0RO1s/nvGsvBy8jfXR1nphzQko=;
 b=YT74F3MbuNlcbG+51W/yhDaSugkMFMhBsovPhas6k4g40i1qaDzXXfuP7U7H/x/EaF
 +2ulPHm3MwpiCpYCXeDpOJeLBv2V5nZUJKjIE3HK18XO19vwVYtYD6XkECcZULiAi+dU
 Gxf1wzRNoBrgX+LbNjz9NjwujXZbPaj2vu1mgMLC7Xp94Rx3S4wczSy9/D/Rpg95b29B
 GKKYV17gQDJSUPi57ZrPx2Bwl+9XHYcFLNo/L5kz9Xscyxo4kSuL554OXz8B/acZ1wyW
 mY0nhABm09UdsUSm6wFB3J5FRqdCQfV8bG6F2ytsWiGif4pmMyVedzVHxT2N6IllkN3S
 I2VA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+CgpOYXZpMTIgaGFzIHRoZSBzYW1l
IGludGVyZmFjZSBhcyBOYXZpMTAKClNpZ25lZC1vZmYtYnk6IHNoYW95dW5sIDxzaGFveXVuLmxp
dUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5jCmluZGV4IDk3ZjdjNTIzNWNjOS4uNDVhM2VjZWJlNTU2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCkBAIC05Miw2ICs5Miw3IEBAIHZv
aWQgYW1kZ3B1X2FtZGtmZF9kZXZpY2VfcHJvYmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKKwljYXNl
IENISVBfTkFWSTEyOgogCQlrZmQya2dkID0gYW1kZ3B1X2FtZGtmZF9nZnhfMTBfMF9nZXRfZnVu
Y3Rpb25zKCk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
