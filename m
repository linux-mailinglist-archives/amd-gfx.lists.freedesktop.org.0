Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23247E41F
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FCB6E7D2;
	Thu,  1 Aug 2019 20:30:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3346E7C8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:14 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so71645085qtn.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJ5Z9GrJoMwJUrIvI/UbDvCUOoY8xX0ZYTLnWS0kPp4=;
 b=d1/swr8ysTBsIBOZmjnQw89B+/YC/Mjo+EkPKdlAMHTaXP0XvVObOMCDXAnIHFkagg
 cTVKLYibJXH5Zq3MKIz/OU3D1i4kZjQfn+nF2VttZrWubgW8lh2jdTgA4qM0SqET9AXh
 blg+gBESqhLrMc+Ax9DAdQvMIxm4zlw1KmytZ68rFlaJifXTYL+sxOEY8l46YaMaHozZ
 vKyW9gaRwsrp7QK8SAtqbgvT+yepC3bZ1s9LC1YH61NT40supOorktQerYYNnQEgotFL
 9FQdXkL0WQVkESNTNZcAfMviN2sGlakK0LPMWbOGNSDZi6Dig94/LrkpKcEzHs3YIs+X
 F8Ug==
X-Gm-Message-State: APjAAAXZjZ8WTdTzMavH/AlCst/bqP8BTBMKT2B1wzj3Ivjl/C6w977F
 OwkTlAi6mzyv43YeKkMS167j/Tu5
X-Google-Smtp-Source: APXvYqySGVs2P1okEx71//NnQIUZr7/2HJOFj7ujfsKQMNETAYYddm8ZdLnAu9nPHFNj0Fllegv1vw==
X-Received: by 2002:ac8:3811:: with SMTP id q17mr89527482qtb.315.1564691412976; 
 Thu, 01 Aug 2019 13:30:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/36] drm/amdgpu: set nbio/hdp cg for navi12
Date: Thu,  1 Aug 2019 15:29:29 -0500
Message-Id: <20190801202957.29791-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJ5Z9GrJoMwJUrIvI/UbDvCUOoY8xX0ZYTLnWS0kPp4=;
 b=DIrEBq5o7BXUeSK4GF11Dm7yktfBoPjrIB30OlX61xP/doV3pkvxG4yLJLIZ1x711s
 59Yp5orzu1W8V3WFyYf7k0r+75uZ1MeZyLpHSrvQcNdE28SW+X7Xlh0Er+ukudDld7im
 dHKq84XnHq0RsXwzlDt08X0j2zQRHyHphRreObPUek7PPOoxU8aLpccf+8mLjvy3C4AE
 lviBKR4WB0BEh65JYuFiChohSbccmmqtmdu8tJhY5KWFakrgTamAacqWPlSePELNT5KT
 Amgh2lbPC0Wff93ku3E+njnlJUv0qv8zAk00FzajGRLBRvnZ8ETwKl9TJiVE6hpRW3jN
 /KKA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IGJkYjZmYTQ2NzRiNy4uMzUyODQ3
YWNmZWFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTc5Myw2ICs3OTMsNyBAQCBzdGF0
aWMgaW50IG52X2NvbW1vbl9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAogCXN3
aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBf
TkFWSTE0OgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWFkZXYtPm5iaW9fZnVuY3MtPnVwZGF0ZV9t
ZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCiAJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRF
X0dBVEUgPyB0cnVlIDogZmFsc2UpOwogCQlhZGV2LT5uYmlvX2Z1bmNzLT51cGRhdGVfbWVkaXVt
X2dyYWluX2xpZ2h0X3NsZWVwKGFkZXYsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
