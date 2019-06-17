Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD948EDA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC3F89A1E;
	Mon, 17 Jun 2019 19:28:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221DD899B0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:05 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y57so12255797qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wdqf9iaf5glFL5z22+gN8/Rl6a3RMIMKP2QaxqpWJzE=;
 b=QtDYS4VJNO5nNXN6urF32IJv6Fwvz3oAfz+fiobu8JffDMYQYru6Ase7dKgOhqI1IR
 a7fMBxbBIyJqGHfMbbWUt8fBbTS5h2kSepU7CXlko+eum8ePM9Y7f88tD9AnaXb1VDBZ
 lR6jTjSke82eItnkEB4skZPgQlfRDhBN7MjhDH3FV9UBOKqJdUYmB0PF4zyEnoEP9AyK
 YzM0At0z6OR3x6OKZ+2O/MfiKpxB08qQylWE841QDmKsz/36z8zZeGf65WaLEOFeCN7d
 vjcVqL2W2+hZoeLc6t+y5ox72D4TmF3JjxhDCgbdzJQvy8pBppJTw05UOtfPZBLW6+FY
 pwzw==
X-Gm-Message-State: APjAAAXwF243aqcXewa7IYyb5VOCHELcKvHYIYtUSFnkSlUZP8WIHusN
 Re581N+86xSZja1EYrJvTDQmzdSs1cU=
X-Google-Smtp-Source: APXvYqxnP09ZQ37woSNs3RT8l/+BCbNknMaxUFQ7cq9aZKAQZWUHi1MHE4vJx1+2PPabMCvDEXiQuQ==
X-Received: by 2002:ac8:5141:: with SMTP id h1mr60724288qtn.15.1560799684140; 
 Mon, 17 Jun 2019 12:28:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 155/459] drm/amd/powerplay: skip od feature on navi10 for the
 moment
Date: Mon, 17 Jun 2019 14:26:20 -0500
Message-Id: <20190617192704.18038-56-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wdqf9iaf5glFL5z22+gN8/Rl6a3RMIMKP2QaxqpWJzE=;
 b=s4bvcOrB0JJTlAVVPIPu0bNBYd87NiO6ezaRcKNFPQ8+BUab/6LGOxRPPL31Thr6bg
 E6aXH39fvbpCVnSgj0UbobeMWwgfK2mp0OBYnvtEm3CGyge/pxq68BNSCSNCAUCOx/Sq
 FalSS7ZhdV8bsOVj+chV/yuPp9gTm5Euk0O0ISzRjaRRvjr+t1PDHSdXPlB0tHVSUeJL
 0fRTM5qnMPB9OfUonDtjtUZG/vbDyK5msLIYTARcGBCLQHkJi1qXtMuOPGg+hRYaniKQ
 SGds/DnYI6xjAy/45K1L19lcZfNjfhM1zDSl5kV2QjadjNj8bf5qm7lywQ1G6/d2EhRJ
 rPOg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCk9EIGZlYXR1cmUgaXNuJ3QgZW5h
YmxlZCBvbiBuYXZpMTAgc28gc2tpcCBpdCBmb3IgdGhlIG1vbWVudC4KClNpZ25lZC1vZmYtYnk6
IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggNDMxMWVl
MzhhNzc0Li43YWE2Y2YzYzBkYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3NtdV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Nt
dV92MTFfMC5jCkBAIC0xNjE4LDYgKzE2MTgsMTMgQEAgc3RhdGljIGludCBzbXVfdjExXzBfc2V0
X29kOF9kZWZhdWx0X3NldHRpbmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXN0cnVjdCBz
bXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKIAlpbnQg
cmV0OwogCisJLyoqCisJICogVE9ETzogRW5hYmxlIG92ZXJkcml2ZSBmb3IgbmF2aTEwLCB0aGF0
IHJlcGxpZXMgb24gc21jL3BwdGFibGUKKwkgKiBzdXBwb3J0LgorCSAqLworCWlmIChzbXUtPmFk
ZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCkKKwkJcmV0dXJuIDA7CisKIAlpZiAoaW5pdGlh
bGl6ZSkgewogCQlpZiAodGFibGVfY29udGV4dC0+b3ZlcmRyaXZlX3RhYmxlKQogCQkJcmV0dXJu
IC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
