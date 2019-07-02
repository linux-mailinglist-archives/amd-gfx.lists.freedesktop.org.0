Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C55D75A
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074B6E04A;
	Tue,  2 Jul 2019 20:29:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7E46E048
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:05 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so20143044qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAoMg+RtHYKi6uk6owQbeRl0tEgbrSI1T6hVj6dEhes=;
 b=Hil11b0tU6TZAGjFMdaCHozr7qQCySTmAP4jxl/8GquhnaYaN2pogQb4hDZVmPm5ER
 3WI590vJXjEJjWpvulB8ivjh52w4ypqVFM3iM2ZN34KusL5xZEUFYV1Wn4j7uPjTtctY
 znQfx5dYb06+or0r0Ouaj67L2MjeQEvUgx1mShv3oM5QL2+Bso4Kwe//aSWE+mQfvRgz
 3DIEWxWRT5oEjx8X64Rq0AJxlMYs/GzecVOfJp92r/GMnb6NzJfCMmz+U/GD5zMtUlQU
 LrcCExuk5C/J0V35sCA6zjY8tJ5K0TnwX5uucWgUJ/wuh6VlHxInbhLr+sHPY6qlXqVw
 ERyA==
X-Gm-Message-State: APjAAAUWSGTGTEGAmrq9nVMZKDrn/gqCo2l8vZUbq9QGioojRG6djCjX
 sakByoJs94126xGNtGfTKbFON4mXkHI=
X-Google-Smtp-Source: APXvYqyO2utO3/IRdEuy5Zy6aU/t0D+Qr4Wc1zZ+hlAiV6eHUcX3S8+IXexqDqQxjnX9Rf9SbmcQEg==
X-Received: by 2002:ac8:2f6a:: with SMTP id k39mr27282858qta.13.1562099344480; 
 Tue, 02 Jul 2019 13:29:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/53] drm/amdgpu/sdma5: add placeholder for navi14 golden
 settings
Date: Tue,  2 Jul 2019 15:28:01 -0500
Message-Id: <20190702202844.17001-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAoMg+RtHYKi6uk6owQbeRl0tEgbrSI1T6hVj6dEhes=;
 b=SvA8oGyHI4NG5Zs9wqT3BQtQuhbgRRi9yfH/17uQ/lOJsHijfRrVtQKglqMX9z0tDk
 m4fcSmq7HgAV9/Ar8kN/jWh/KQw5eq6hsZvj1/mIVJ/nDLEnPKvxHG6Ht9pO9fSH2q6k
 BwEjXcZ36UmQdqt1vsbxDdckjB8smFj6zM5wKC+UGJSdx25/3nFMtTBAV8+ccEe89aRj
 bR+LjhrB1XQS08zfBYDhRlmvJD57AnWxxbtPIgj7CqytcrpIq4S6WJKvkudi/UgGk87J
 k5rCRVjDVLsGW4xVL+yunUKWnq7XdIIehVUoYTgUWCmbX/bVtGenlIl9+FATjKNH0ePA
 tUMg==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClRvIGJlIGZpbGxlZCBp
biBvbmNlIHRoZXkgYXJlIGF2YWlsYWJsZS4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8
eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCAxMSArKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjVfMC5jCmluZGV4IDFiZTdmM2U0ZDY1MC4uY2FmMzRkZDNjNTczIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwpAQCAtODUsNiArODUsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX3NkbWFf
NVtdID0gewogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0
aW5nc19zZG1hX252MTBbXSA9IHsKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jMTVfcmVn
X2dvbGRlbiBnb2xkZW5fc2V0dGluZ3Nfc2RtYV9udjE0W10gPSB7Cit9OworCiBzdGF0aWMgdTMy
IHNkbWFfdjVfMF9nZXRfcmVnX29mZnNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMy
IGluc3RhbmNlLCB1MzIgaW50ZXJuYWxfb2Zmc2V0KQogewogCXUzMiBiYXNlOwpAQCAtMTE0LDYg
KzExNywxNCBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y1XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJZ29sZGVuX3NldHRpbmdzX3NkbWFfbnYx
MCwKIAkJCQkJCShjb25zdCB1MzIpQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3Nfc2RtYV9udjEw
KSk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTQ6CisJCXNvYzE1X3Byb2dyYW1fcmVnaXN0
ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCWdvbGRlbl9zZXR0aW5nc19zZG1hXzUsCisJCQkJCQko
Y29uc3QgdTMyKUFSUkFZX1NJWkUoZ29sZGVuX3NldHRpbmdzX3NkbWFfNSkpOworCQlzb2MxNV9w
cm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKGFkZXYsCisJCQkJCQlnb2xkZW5fc2V0dGluZ3Nfc2Rt
YV9udjE0LAorCQkJCQkJKGNvbnN0IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19zZG1h
X252MTQpKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
