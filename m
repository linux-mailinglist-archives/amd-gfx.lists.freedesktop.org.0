Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D132F48FD4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB6889CE0;
	Mon, 17 Jun 2019 19:46:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7989CE0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so12288307qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gYmAljSRqV8cUYesED1UxHIyGStQj+EQAr7GidafEbE=;
 b=a0HNBOIS/PiMTWYsEqOCiDRP9VXeay6KLFFBPPCNSsTzxwsWwwZKa9NE6cAEyMzX4j
 6OwsxuxCZ77Alwk79BQz1lv12xWlO/eg7OtSP85M24/laeIW+CUX0urVE5dR+omqiRjw
 knqIL1XyJybZQEGy6OlL8XfDE0Z3CM0m+56lwNdoFl5sDhROSxVhXa4aSioi5BUY+rat
 xjtbuqDG6axblFReOvUzX5JNZZhnEOtr759+x4IULDsQDJ/jSxVEehdZ8GIhWEFwsz5m
 8N1uarPyVpEq9VvpyYVvP46Vow6Wpzo66BU3k4JbphxonUxuUBCiG0/D3uJH0WcM0KB7
 cdww==
X-Gm-Message-State: APjAAAVfUmWGDuMZeJVOUmb2ZwlGEscpzmg/J9XIsQQ1aB+rTr25KjJu
 o7rjd+qTm3XnjlMLZzLRt42YcH9JiIs=
X-Google-Smtp-Source: APXvYqzg/zNmMjEaNL1jfw+U4BXQIzicfPteGaDeuEIuRAjL8PTlk7Z4MSPJrSjjHErae2OCLBXwxA==
X-Received: by 2002:a0c:929b:: with SMTP id b27mr22670943qvb.193.1560800755979; 
 Mon, 17 Jun 2019 12:45:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 305/459] drm/amdgpu: add new navi10 DIDs
Date: Mon, 17 Jun 2019 14:44:06 -0500
Message-Id: <20190617194540.18497-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYmAljSRqV8cUYesED1UxHIyGStQj+EQAr7GidafEbE=;
 b=CQ/+wyD95emIrCuv4UTVMdVp4F/FmrYa7QZV7LTyTPenbBm26EBiwKW7TSOCfVBkr1
 KVq8weQ0efrF77llrTWkFuBA3CD2NRqu0fAwvzq/0ONnieGvWBi4WsO8F5JlYXzhPTNM
 DY1tPLiQU56XzE6yS/sGzKZr31RVrFjJRwowJ6OU5SAiD4wGrG0kBaeOYlitQTbn/KcK
 K2WH3KTvnytctusFDG047iZX1YXs0cdHzBcrWX1qMkwMco+L0wtkZqSZK+htiQeNyv7O
 JFQGv1nD1SfeoU9RgZGqBhhmomXnURMdARFYR3PCjDKRNxwSgWN8g8OkCqsrNvgUMYcL
 qQEw==
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
 tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClJldmlld2VkLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlp
bkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCBkMDE2OGUwM2Q4NWUuLjdjZjZhYjA3YjExMyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtOTg5LDcgKzk4OSw5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAl7MHgx
MDAyLCAweDczMTAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTEwfSwK
IAl7MHgxMDAyLCAweDczMTIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFW
STEwfSwKIAl7MHgxMDAyLCAweDczMTgsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENI
SVBfTkFWSTEwfSwKKwl7MHgxMDAyLCAweDczMTksIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAs
IDAsIENISVBfTkFWSTEwfSwKIAl7MHgxMDAyLCAweDczMUEsIFBDSV9BTllfSUQsIFBDSV9BTllf
SUQsIDAsIDAsIENISVBfTkFWSTEwfSwKKwl7MHgxMDAyLCAweDczMUIsIFBDSV9BTllfSUQsIFBD
SV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTEwfSwKIAl7MHgxMDAyLCAweDczMUYsIFBDSV9BTllf
SUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTEwfSwKIAogCXswLCAwLCAwfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
