Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903677E43E
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6F76E811;
	Thu,  1 Aug 2019 20:30:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE59B6E7E5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:37 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so53094888qkl.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJ4Bw6/tDk9lIGkseCp/Ikt8XmOOSLlV6nlM1+HREew=;
 b=W7VQEuf5wvHgnbQUP62+rmstoe5HkgiseVa0rJLoe5QIBFGk4c9R4a5+EkKkE8fodF
 MU4ZLWNbscW/uzPWI1h43N4qGu7O4PC9C4XTeQWYww2mwHV2csctyn0KkgxkFAkGZlvE
 1q9zLvt/SS4EWhMHy3sZ8cZmq5+hP7G2L8SUCglkf58WmDL9CAQPX3wAiYfxIXFNt+g1
 2dyVohhrlW93fMrshUkaFUdkP2ZVFMZEFlaxGA+6bq0dfX4PQEsR2kvkWKoO4XTK/ifp
 xNJeaJVP/VwJguEkgVnMCMfhbpjFGDnf64ChFjbcWDusrpLlHDXLN0N5co8WumCSHLAs
 pvPw==
X-Gm-Message-State: APjAAAVrAIJNL95u6L1DgGgKrT4fRpQKN31etWDJaH/gqp0E8YO1x3kj
 fPpQ/cC6ViRqxhVSSrMCrwkZEFD0
X-Google-Smtp-Source: APXvYqx8XcbVbq5D9ML6fIUwySqPLcygdG2WW+Q9y7GUpoLMEyUXfIE/+RHHMixfaYqX8Gw1zZVOfQ==
X-Received: by 2002:a37:8103:: with SMTP id c3mr87742001qkd.114.1564691436564; 
 Thu, 01 Aug 2019 13:30:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 35/36] drm/amd/display: Add missing NV12 asic IDs
Date: Thu,  1 Aug 2019 15:29:56 -0500
Message-Id: <20190801202957.29791-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJ4Bw6/tDk9lIGkseCp/Ikt8XmOOSLlV6nlM1+HREew=;
 b=dt6eFAFUrfnb7gOCr0HqGGwBysJ28tCi9rh4LtUBKFxs3VtS2//ObFwxR5l4jgMUAE
 qUc3ziJUt7y89vs0Xy5dXn8z6Zyu6W2fJhLVOa7/9fQIoP6Bh9ytxKj89No18Bmtbp8n
 p2+GmGPryJBP40W4FsqZ2xhF3+9LX/m9V8dbCdBeun9ok9hgdN8X0LJhaHE6if4uFPTH
 ixoTr+2Netfbj+XHCbJ56Ngt7SQLY0ylyb1fGV0Btwy4prsGpoZRJlqJHbHS7jKM/Hn+
 ugqWnDFCwKoWMQYqmp7lndSGToqG86XgUlAohvhRJ4coeRcbnFagctkn7i6xazPY4El2
 g88Q==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+CgpBZGQgbWlzc2luZyBuYXZpMTIgYXNp
YyBpZHMuCgpTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGZlNTI5MWIxNjE5My4uYWYxNWM0MzQ1Njg3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
QEAgLTgwOCw2ICs4MDgsNyBAQCBzdGF0aWMgaW50IGxvYWRfZG1jdV9mdyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJ
Y2FzZSBDSElQX05BVkkxNDoKKwljYXNlIENISVBfTkFWSTEyOgogCQlyZXR1cm4gMDsKIAljYXNl
IENISVBfUkFWRU46CiAJCWlmIChBU0lDUkVWX0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2
X2lkKSkKQEAgLTIzNTcsNiArMjM1OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXRpYWxp
emVfZHJtX2RldmljZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKICNpZiBkZWZpbmVkKENP
TkZJR19EUk1fQU1EX0RDX0RDTjFfMCkKIAljYXNlIENISVBfUkFWRU46CiAjaWYgZGVmaW5lZChD
T05GSUdfRFJNX0FNRF9EQ19EQ04yXzApCisJY2FzZSBDSElQX05BVkkxMjoKIAljYXNlIENISVBf
TkFWSTEwOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAjZW5kaWYKQEAgLTI1ODcsNiArMjU4OSw3IEBA
IHN0YXRpYyBpbnQgZG1fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAjZW5kaWYKICNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKIAljYXNlIENISVBfTkFWSTEwOgorCWNhc2Ug
Q0hJUF9OQVZJMTI6CiAJCWFkZXYtPm1vZGVfaW5mby5udW1fY3J0YyA9IDY7CiAJCWFkZXYtPm1v
ZGVfaW5mby5udW1faHBkID0gNjsKIAkJYWRldi0+bW9kZV9pbmZvLm51bV9kaWcgPSA2OwpAQCAt
Mjg5Miw2ICsyODk1LDcgQEAgZmlsbF9wbGFuZV9idWZmZXJfYXR0cmlidXRlcyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkK
IAkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEwIHx8CiAJICAgIGFkZXYtPmFzaWNf
dHlwZSA9PSBDSElQX05BVkkxNCB8fAorCSAgICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJ
MTIgfHwKICNlbmRpZgogCSAgICBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTikgewogCQkv
KiBGaWxsIEdGWDkgcGFyYW1zICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
