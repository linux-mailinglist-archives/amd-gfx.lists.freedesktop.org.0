Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B887E97
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A056EE42;
	Fri,  9 Aug 2019 15:53:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23716EE3C
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:18 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so725289qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kveuLjYsVmvl4p1hPklk+/n8U1VrIYGDtZ1y0lEMIj8=;
 b=FdcW2slgKPalCy3NzFaU6LWXW0DmAKMyq6SSc5tmA5kUd6gO9nuiGRR4J3G3yVxJvk
 owjAjBv0tSPf8bALCJJLA7cqFoEW5hfa8NpiJTMobIZJg4ua7otP6zuStr5jfjR1As0i
 NtgknQAMeGLQQ3oiY6vMF34+OGz5FyzLnoGEoWXvhZ4329tQlbAmIET3Sb4AgycJvA0I
 OICkAC8qlO95fIqlitvelNYNyiMlIbLJEnaesOL8cqQJ7I+2kK/TMSyuaDLO2LiUtfK8
 4OPPpJyIdPtUgBJJZ5wMkaAqr1DtP6BPPfnRchu2R5ihV2FjZC5oRRC9QJ+0I/JixT8Z
 fCpQ==
X-Gm-Message-State: APjAAAXKvocrDCd3OgP/1d/q8vvkzai+ftAIo/1DLsps/8FmBxsoBD6m
 PJNk7KcfYJEcXlYdsDpVzVjSeadE
X-Google-Smtp-Source: APXvYqzuEgqSp12styC5YwGkQX0G5vLA79W6ONZGCoHaeV2NdJ+fh+tMAKJYn+9xrtbScvX85ioemA==
X-Received: by 2002:a05:620a:659:: with SMTP id
 a25mr2424843qka.148.1565365997773; 
 Fri, 09 Aug 2019 08:53:17 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/27] drm/amdgpu: set ip blocks for renoir
Date: Fri,  9 Aug 2019 10:52:44 -0500
Message-Id: <20190809155302.4733-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kveuLjYsVmvl4p1hPklk+/n8U1VrIYGDtZ1y0lEMIj8=;
 b=fUqvK9gYg2TxxEQPu/cUezQZkk3s+iZNfSP9z3sX6pCIA/FkyHCBauoo6/3k403pqI
 WPvDGAJY196UyxM0GowFkVfYeAkvh2OcOYhNhZqiCcl8QxjYa4FPAkqjVJ1sqqjFL+ti
 5QZAxefydURakNua7l+CuTsLWzZaSSmzMg8BOFde+LwoCSUpU/4o2MfDcKmxAKZ89pGs
 sz6AvLhhJEtvOzWL3UN8+Uo1tk0EMb14zbzzNX2Q2uFPwAV201S7fpwcT3XWheEFAMVr
 JvJ83hO1iorXnj73hYLPlt1glz2sVBuvqD416LZKAw6xvSVqOOozJ0sBvABBFlhd+ezo
 9RAw==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkVuYWJsZSBpcCBibG9ja3MgZm9y
IHJlbm9pci4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggOGRl
ZWYyY2YxZTY5Li44YmQzMDllOWQxNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpA
QCAtNzQzLDYgKzc0MywxMyBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92
MTFfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2Y25f
djJfNV9pcF9ibG9jayk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9SRU5PSVI6CisJCWFtZGdwdV9k
ZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2ZWdhMTBfY29tbW9uX2lwX2Jsb2NrKTsKKwkJYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdtY192OV8wX2lwX2Jsb2NrKTsKKwkJYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9paF9pcF9ibG9jayk7CisJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjlfMF9pcF9ibG9jayk7CisJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y0XzBfaXBfYmxvY2spOworCQli
cmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
