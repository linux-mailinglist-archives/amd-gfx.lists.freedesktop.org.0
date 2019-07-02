Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D195D759
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38B6E048;
	Tue,  2 Jul 2019 20:29:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33476E040
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:04 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so50099qtu.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXtfPiwmRf48DJUF1KUEtchJuYqUWqUHfonitPgiORE=;
 b=D0ZqekEfp1tqj3ODjJ1QEvU5JHpeI3SxFOCfnh5AK1nhN8LzSmS/3o2gmCLfVZ4Oj2
 PUVamsljRfrZ0y8vY8zgBizAfJvkjfaHQaIW2fkG9bgx+P1ks9u3hu6SMMpMOM20xKGE
 fxWHnM/YtDml6a+EoEhUGMOWzZg4BhcHDx7q3XY46nfF5RxyKHpSIbrbqnn9okHl/Shd
 gRJ4KOu6XOMoGn1fil6eZaLeGye4Tdmt5skKtkXZice0JRLTAqy5x0SuWOqqUMtf8vlm
 Y6oASfoP9HQMfkzpdGp68O7/sIS++4rDPc5i4684l4/v8OD/p10F2v5+OCDtzdQZrf+B
 41Sw==
X-Gm-Message-State: APjAAAVJ3kg9mkK64kW571QrpnoezwjPE5n8KeLv1DIa8RP1dz7syu4f
 GI0CHAAqJkDIMZ9R36jItIS2ZQE0T60=
X-Google-Smtp-Source: APXvYqxaBtgPni8EirHY+6/eWiw/lAdhejlfw0CqF1EtWHQr8kWnPly8TJExOWctyldqF38RtHegTQ==
X-Received: by 2002:a0c:b758:: with SMTP id q24mr28341479qve.45.1562099343647; 
 Tue, 02 Jul 2019 13:29:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/53] drm/amdgpu/sdma5: add support for navi14 firmware
Date: Tue,  2 Jul 2019 15:28:00 -0500
Message-Id: <20190702202844.17001-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXtfPiwmRf48DJUF1KUEtchJuYqUWqUHfonitPgiORE=;
 b=jDJBUobfAahTP3clTBwyqLSEutHwyGfESWm0zsSWaxjLdqFacdp3myrw0m9j7yMdjh
 QXX7/hJKdkXIUz6DfXyb/ZLVXDS8l4n8mnZ9Wpm+ORxoWZ2ubxDALVwRwXgrsqDVpq20
 uW155z0yQbBCLqTDpV5c6LbzC20ha0fwWSVImHEXWupsY5hC3z6nxXYvTfxDFJ+30COq
 qV11TXQhNipz0aDqPtalKdrmewx65Vz5QnSZZYACrwyaqB5YU1K8cm1jz/YJoN90Xdzg
 NPPgvq4YBDwTrmt41KC8qqpnMLnnJr8uTa6IBQsVmCaXS39mybNQ/RSg+oFY7wkcoue2
 WxzQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBzdXBwb3J0IGZv
ciBuYXZpMTQgc2RtYSBmaXJtd2FyZSBmaWxlcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVh
biA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgfCA2ICsr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NV8wLmMKaW5kZXggMzc0N2MzZjFmMGNjLi4xYmU3ZjNlNGQ2NTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCkBAIC00Miw2ICs0Miw5IEBACiBNT0RV
TEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTBfc2RtYS5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgi
YW1kZ3B1L25hdmkxMF9zZG1hMS5iaW4iKTsKIAorTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2
aTE0X3NkbWEuYmluIik7CitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfc2RtYTEuYmlu
Iik7CisKICNkZWZpbmUgU0RNQTFfUkVHX09GRlNFVCAweDYwMAogI2RlZmluZSBTRE1BMF9IWVBf
REVDX1JFR19TVEFSVCAweDU4ODAKICNkZWZpbmUgU0RNQTBfSFlQX0RFQ19SRUdfRU5EIDB4NTg5
MwpAQCAtMTQzLDYgKzE0Niw5IEBAIHN0YXRpYyBpbnQgc2RtYV92NV8wX2luaXRfbWljcm9jb2Rl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJCWNoaXBf
bmFtZSA9ICJuYXZpMTAiOwogCQlicmVhazsKKwljYXNlIENISVBfTkFWSTE0OgorCQljaGlwX25h
bWUgPSAibmF2aTE0IjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
