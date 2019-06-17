Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8048F9A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8389D58;
	Mon, 17 Jun 2019 19:33:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8338289D52
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l128so6971516qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cLcdcInxbA8g5d23mBJRIh7oGLw9CsgH2pnu9cum8Y=;
 b=BauiIZ/mjUNEk1wHglTGtSqN4tHoLbE3fyDp6mVFdGOrRvxo9otwyGMUx/U11ZJU4S
 HiL/qw1gEaPz3USeWPfrypOmUpz5aHzLfeUh2eneZjbBVIG5HGHzzW6e1T85WZ8nu8D4
 EMTW7xhDB85Ht3ktmoRquebcw030IeJosiDnIy28REv1UOb212nTvL2sSbo0ZX8hYY74
 vhN7b2w3KXHPYdndlGkQeCaJEfkVqAGZsmQTCFiJirUuqE4HTk8irBaWkUDOjt6HdOoa
 poaISJs0sYwtXWt4Fzgi8/NghKLpPmuJrJ8KydqO9ImKaZBikFGR3Xq5rwrErbsEeSgf
 ZN0g==
X-Gm-Message-State: APjAAAXuK3k1CtOmDvK5H8o5llQq15GShto0WTQjSAWKnYjabpC/DWq8
 mIEF4LEaMjDKsGjn0Eock42XScEAvnE=
X-Google-Smtp-Source: APXvYqwPOhcTuh/FqPkEkiSsBEjX6PO4h3XvjOoGalPGOnJCx4TvlJV5Oa0RP7Pv/XUHrChtZdVS5A==
X-Received: by 2002:a37:4243:: with SMTP id p64mr8152788qka.9.1560799957557;
 Mon, 17 Jun 2019 12:32:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 293/459] drm/amdgpu/psp: add new VCN RAM ucode id to psp
Date: Mon, 17 Jun 2019 14:31:00 -0500
Message-Id: <20190617193106.18231-94-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6cLcdcInxbA8g5d23mBJRIh7oGLw9CsgH2pnu9cum8Y=;
 b=mKWGbHdLrtRCAeiDQEOilhFtw1ROiTvEu1yA1vF1HtuSu/GaNXDSJOnXOVobB5H/SB
 cbVdLVR+o1AlDb1m8pqb5KYvr2Qo9Zqa9cqUSLqX11BPQy+TOQMYmyjq2KeG+XC9yOcJ
 bS9JJKZl9gMRdvsNRQZWVdS5eT6rwYD2rd6Qnrj/KUaOvU4C2BMmX3enobFta20nP4rY
 gq8hlhYLR8uN4gZDtPIVWlWZVQxG6oIN8iehB0BWWbc9o3o2TMwnLC5WvTDuB38ZPD34
 miy7Xh5Ym143dny3i3XmzPcmq0ksG3Y//g/zCTKIu77cWUbSKCQqXHxivdbbvuhBCAZX
 YkPg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClBTUCBzdXBwb3J0cyB0byBwcm9n
cmFtIHZjbiBzcmFtIGJ5IHVjb2RlIGxvYWRpbmcgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1ieTog
SmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF9nZnhfaWYuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfZ2Z4X2lmLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfZ2Z4X2lmLmgKaW5kZXggOTQ4NmJiMzZlYmY5
Li41MDgwYTczYTk1YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Bz
cF9nZnhfaWYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfZ2Z4X2lmLmgK
QEAgLTIzMyw2ICsyMzMsOCBAQCBlbnVtIHBzcF9nZnhfZndfdHlwZSB7CiAJR0ZYX0ZXX1RZUEVf
UkxDUF9DQU0gICAgICAgICAgICAgICAgICAgICAgICA9IDQ2LCAgIC8qIFJMQ1AgQ0FNICAgICAg
ICAgICAgICAgICBOViAgICAgICovCiAJR0ZYX0ZXX1RZUEVfUkxDX1NQUF9DQU1fRVhUICAgICAg
ICAgICAgICAgICA9IDQ3LCAgIC8qIFJMQyBTUFAgQ0FNIEVYVCAgICAgICAgICBOViAgICAgICov
CiAJR0ZYX0ZXX1RZUEVfUkxYNl9EUkFNX0JPT1QgICAgICAgICAgICAgICAgICA9IDQ4LCAgIC8q
IFJMWDYgRFJBTSBCT09UICAgICAgICAgICBOViAgICAgICovCisJR0ZYX0ZXX1RZUEVfVkNOMF9S
QU0gICAgICAgICAgICAgICAgICAgICAgICA9IDQ5LCAgIC8qIFZDTl9SQU0gIE5WICovCisJR0ZY
X0ZXX1RZUEVfVkNOMV9SQU0gICAgICAgICAgICAgICAgICAgICAgICA9IDUwLCAgIC8qIFZDTl9S
QU0gIE5WICovCiAJR0ZYX0ZXX1RZUEVfTUFYCiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
