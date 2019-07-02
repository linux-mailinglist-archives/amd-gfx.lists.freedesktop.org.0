Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6C5D753
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9046E044;
	Tue,  2 Jul 2019 20:29:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A7B6E041
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:28:59 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so20142620qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0S4JwoBvfVnzcEOIAkUG1a8FW53zkgXtVEThTc1+yfU=;
 b=GaRDMD3K16CdZ2QsDoIk3mDqqhlfRTuCfi/ZVUTcN8zC6uxUxpHPVseeWcomxdCFbo
 b7J5EsBt8S5tqb2WvCsRinWPyMsSC3Q1NYD2szeZ/qO0vmjitVgu/YeiDvbhj8JCoP9w
 cA7hxnJIRULfEGcwU9vLqEPmbPvsv27I+3TDetwE/fdvbZnQeqzjxO9HQd5RsHD+CjX4
 43KKjX5W3Oky9FzQIxS1qmg4tEsuTrWbvwcVCQTvny6neY5bW4IHaYhbYPttYB6bTG3o
 mz4cI1+v83yY43lPMDifDzLiJS3Z61rJWZ44RXC4IhnXhELCP8g3gR5yWzBrH8cNaAQH
 mpFA==
X-Gm-Message-State: APjAAAUtQKM7Y2Fh7PdgXAPh9FPveB/7LxcFbfyoH4oOdnQ/kUpo62fH
 hH1bRKqVfJodzT8ixTkXtEsuStQOHf4=
X-Google-Smtp-Source: APXvYqy7lVf96foSGOqx2uSOCR23qv72Sb/vPs32JOw+EtZBr1otk5mulMYtlUpJpiJDHPw+d1Rk3g==
X-Received: by 2002:ac8:6898:: with SMTP id m24mr26982576qtq.362.1562099337903; 
 Tue, 02 Jul 2019 13:28:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.28.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:28:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/53] drm/amdgpu: set asic family and ip blocks for navi14
Date: Tue,  2 Jul 2019 15:27:54 -0500
Message-Id: <20190702202844.17001-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0S4JwoBvfVnzcEOIAkUG1a8FW53zkgXtVEThTc1+yfU=;
 b=FWXaImbjdzxcv9VtAnTG3mOQqf+AP/kvC8UB9TdPwV7mbh1AQrcPhLx8+5Q/4GzdMe
 v7linDNGSsRXVy8aGXEYQcxrrzZh3o3NKNwx7OxnISJ+FQly5sE7unDeaKNaFlgRWK/h
 6LZCQ/kpJkAkt0/x9I11Lkmp2UmSaYynkocDmb98PL0nsK+he4s3ybA4c/hADPpqwb+j
 gKtqEIE8pOTZdFQOeWBWUG3x5kA5SLupfGUSQ9Mnhes5ukDM4fgCFCSpVAaZSK+QFb3v
 nFtSOUpNnChrCQ40V9v+kHIjeuR+arx7q8EqV5u2UOGTIpoJATtBiw8E6/5ws3yK30UI
 EWCg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgd2l0aCBuYXZp
MTAKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5k
ZXggYjhiZjEwNTkzMTJjLi4wODJkYzUwMjVhNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE1NDMsNiArMTU0Myw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RldmljZV9pcF9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJ
cmV0dXJuIHI7CiAJCWJyZWFrOwogCWNhc2UgIENISVBfTkFWSTEwOgorCWNhc2UgIENISVBfTkFW
STE0OgogCQlhZGV2LT5mYW1pbHkgPSBBTURHUFVfRkFNSUxZX05WOwogCiAJCXIgPSBudl9zZXRf
aXBfYmxvY2tzKGFkZXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
