Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870449046
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92026E03C;
	Mon, 17 Jun 2019 19:49:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523E76E03B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:49:32 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so6980325qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U7Vha8x5uHkNcY7KYMjPE6gpgfAfROZzdamZ6C9QDPU=;
 b=HJNK0GXtt7KSDTr+mzdWaRS4UHLyNI8GYTRjRdZF0MwZ35J2waex0Wi3JiF+hIobgQ
 KMN8BbVuhXvFBr+i4Ut6szUvhCcHsy7zOoBCnJDOHJjPSMXEaI5BQQ5FGC+I2GuZ6K7r
 7eIs/isywv3T5inHQX7vfB9uMJ/i2z7Ea0Y8zkZmsZWu3tbvKi3zuP3E1A7c3l1sLn6c
 QKv6BMKxqc5vNeX+rMzz9moaq5tg1gkOxaeXds6s+H+jgQZhbdtzZsp5LKVRoM6Pp5ic
 PswUO0/WMPTg5kJCgwFpNGU6m672hqQ4fbv90YJnG6BgEA/ghnaS/6Tb0rNxqwuIGqqR
 38rw==
X-Gm-Message-State: APjAAAVu2gablLn9fmXUgo7bSivoIHQ4dfhWqAIprt0dBWNsSPu/whJW
 IYw2KyIVIXgcXaf1zdaZPR81SodekIr6zg==
X-Google-Smtp-Source: APXvYqx+xzm2zbMGHeGcZWtDb4q7ud7xMdklBtYutwKy1iZuKHFOdMv7kSlEMV5JTYv/O3oftbSEeQ==
X-Received: by 2002:a37:a110:: with SMTP id k16mr67808643qke.97.1560800971361; 
 Mon, 17 Jun 2019 12:49:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 34sm8125381qtq.59.2019.06.17.12.49.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 399/459] drm/amd/display: Remove duplicate define of
 TO_DCN20_HUBBUB
Date: Mon, 17 Jun 2019 14:49:15 -0500
Message-Id: <20190617194915.18618-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194915.18618-1-alexander.deucher@amd.com>
References: <20190617194915.18618-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U7Vha8x5uHkNcY7KYMjPE6gpgfAfROZzdamZ6C9QDPU=;
 b=gev9DEFV1N4sBnsRNKWcMBn5LPHltMvUl/1zqeI06yOZ55BDH76IoaB/LW97qGULdF
 2VboVQwGOyEZccWbW02vLBZGdZdj74p+QEx++F0Dl9h7S11uJzty4HKMoKLp3rJx6I66
 Q3XBGJ40Jd7Rky9fvhMumXjN2oYwQOeahw4JyhYyu8GZPaNOuhpAtMr0g1AyXaE4fSH4
 u3nsgAhwN45WA/DvQ0xdgYgMY5tTl1p3/euzh3F9gQEph+PicO+bPRbgL/B67VpkufPf
 QnVkKKk6L2CyUTlccasSjbdp7HZhkELLK/H+Y0/HSumZg614kjcymrM6ib7Dgi+Qr6wJ
 JLXQ==
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
 Yongqiang Sun <yongqiang.sun@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9u
eSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+CkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmgg
fCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCmluZGV4IDYzZDUx
YWI1NzEwMy4uY2RkMTlmNTg4N2Q3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5oCkBAIC0yOSw5ICsyOSw2IEBACiAjaW5jbHVk
ZSAiZGNuMTAvZGNuMTBfaHViYnViLmgiCiAjaW5jbHVkZSAiZGNuMjBfdm1pZC5oIgogCi0jZGVm
aW5lIFRPX0RDTjIwX0hVQkJVQihodWJidWIpXAotCWNvbnRhaW5lcl9vZihodWJidWIsIHN0cnVj
dCBkY24yMF9odWJidWIsIGJhc2UpCi0KICNkZWZpbmUgVE9fRENOMjBfSFVCQlVCKGh1YmJ1Yilc
CiAJY29udGFpbmVyX29mKGh1YmJ1Yiwgc3RydWN0IGRjbjIwX2h1YmJ1YiwgYmFzZSkKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
