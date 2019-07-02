Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D35D750
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917686E03D;
	Tue,  2 Jul 2019 20:28:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213716E03D
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:28:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so41225qto.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XviR4bJHQhfSiVExIQR79u/rFlwFMoqp2n8ie3PHBRw=;
 b=mE0dLJgE55h7JpeDfAUJmzpM3/6h46GIPJsyYi5HCg3a8eprQaPne6ok54w8kE4BVD
 Evq9UolCTtRClZKZPALEvQiUt5HFpa44lBJ3HH1A0VFVKdjrMkAve2ziOip4YChRRJkI
 ZQ0JdNt8Jy5yTv0wAW6OEFE7dGzB9O5rUSsS940YDHLHLmeRSSRjlBj0TfXp6Gl2jn2h
 S2nRiGhnu+C9Olycn6lxWgSBtdLEna7U/G0rsaOTNNou7vMyICHNdkJ9yOJhIIETw9Vm
 7/M/6CbvSnRg/SSjm3iDBrVTyBIdtmBGmtHDeKPRUSguIpIM6hhLIH895EVdBGrq3dmz
 zRpA==
X-Gm-Message-State: APjAAAXpz6WWRvCMHI9312f3OKWj1D92COlZfqN03506vhf/4u99ucJD
 6hjfyRwMSKY49NVaKBIjyCd6b5o+5Cw=
X-Google-Smtp-Source: APXvYqyIz9IDh0aFkcJkT1tW48+RsOZ9S76sIoyYBif+PC2BaZGy6zglYawX2/MoH6ygPj8DXxOeTg==
X-Received: by 2002:ac8:3118:: with SMTP id g24mr26968877qtb.390.1562099336115; 
 Tue, 02 Jul 2019 13:28:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.28.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:28:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/53] drm/amdgpu: add navi14 asic type
Date: Tue,  2 Jul 2019 15:27:52 -0500
Message-Id: <20190702202844.17001-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XviR4bJHQhfSiVExIQR79u/rFlwFMoqp2n8ie3PHBRw=;
 b=sI6UDeKvaEc8BMl2fJTyBvfmtw7xRySnzioh2x/u+lO+s8wXmZCh3Vq/GPt6EJRoDl
 o08vQR9AlETAkwMSlDZr0HpQM21gaWqyDhk+/RDTPTir96rzcNoMk99Y6fS5VQNiHgy0
 +PlJTBKSvB73piuUORuMA1WLBIAXYwSexZj0SQlfKeiMN9OyPi4PxzGqkpmH3VjOn7WX
 1DAi8WwLT+4jdDwOu+6eldsePzjn3aqp/CwTHIGlu0uwbJLTgvoKhRerWwmJ0+Tt+Y5h
 L+s6EdBI0vlIPcberhTVMB7gvQAV1vRwkGef02kTXvXGKuxSGt/nieScp3BFj+3gpsw5
 lSSg==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBDSElQX05BVkkx
NCB0byB0aGUgbGlzdCBvZiBhc2ljIHR5cGVzLgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFu
IDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAx
ICsKIGluY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCAgICAgICAgICAgICAgICB8IDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNmViYWJhZDljMjI1Li42MDk5OTkyODk2MmQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTk4LDYgKzk4LDcg
QEAgc3RhdGljIGNvbnN0IGNoYXIgKmFtZGdwdV9hc2ljX25hbWVbXSA9IHsKIAkiVkVHQTIwIiwK
IAkiUkFWRU4iLAogCSJOQVZJMTAiLAorCSJOQVZJMTQiLAogCSJMQVNUIiwKIH07CiAKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCBiL2luY2x1ZGUvZHJtL2FtZF9hc2lj
X3R5cGUuaAppbmRleCBiY2MyYmNmMzI4ODYuLjBjNDc2NmFmMDRhZiAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vYW1kX2FzaWNfdHlwZS5oCisrKyBiL2luY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUu
aApAQCAtNTAsNiArNTAsNyBAQCBlbnVtIGFtZF9hc2ljX3R5cGUgewogCUNISVBfVkVHQTIwLAog
CUNISVBfUkFWRU4sCiAJQ0hJUF9OQVZJMTAsCisJQ0hJUF9OQVZJMTQsCiAJQ0hJUF9MQVNULAog
fTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
