Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3A72713
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645F36E443;
	Wed, 24 Jul 2019 05:00:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9BD6E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:27 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l9so44221487qtu.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmkQ23pKoB2nnDcFVAG9tAxrpeae6LYY2S2MWO2N5tM=;
 b=OR0dTFXWqbaGyIcmmn3ZBCi0xKvnwYfKJ7RzF2CNtJkyzGrozVKsdC581vaRjKo5Ri
 PLVzneyBgwbAb4bGqUygQamlY0sARW4e6h7PZfcvO3hdEsOR+P0B+6fbWvsHBgnsJYil
 Y5McEgT/90uRCc95r/HFyvdB05B1tm1fWeGcu5PYICx4Rl5pSetALRtYX57A3i970UFQ
 qvd4DOBhx0VyCQ012xz+idpQz4pDxTcqP7t/FLVCLyy5LiExHrQtYqjjtGrZyx2qMNDg
 /paljHw6MD/65LagR8CroSPP/oTLKRm5aKne3M9OVrIvojqjvVq+nvjti0bK/Tr/UD4c
 RPvw==
X-Gm-Message-State: APjAAAW8yZ/grItJueDBl2KtuhiX6fEJC8Su+/HDPQPM3bG04uGPbm01
 AaMBGzNkmDdu3oS0V3iTXeGsuhRl
X-Google-Smtp-Source: APXvYqxcknFs20CF/YP5HRqrJH9tzfdFWmB6qAAth2L35ot8iujPw//8JK/suvqT4TlzKzY9sJijag==
X-Received: by 2002:ac8:929:: with SMTP id t38mr56406997qth.287.1563944426194; 
 Tue, 23 Jul 2019 22:00:26 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/9] drm/amdgpu: add reset_method asic callback for soc15
Date: Wed, 24 Jul 2019 00:00:08 -0500
Message-Id: <20190724050012.31398-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmkQ23pKoB2nnDcFVAG9tAxrpeae6LYY2S2MWO2N5tM=;
 b=biljJZ0GT8lp0IDJdmip7HRW8DLg/0KljJ17UxaeR6uVHc5kjuD7aTsF47MoupGi8T
 Mv9Y7KU01kFtf//QxNd1ScjxzpyftUvL7zuZi7njjdKEoHQ+as0th7l0a5p67uDQ6jlk
 OJ04k8K1tinNvbKzlIFr97ReS6M1r3w84wi1tZ+2O70j/hdRjbZc88OOaccG3JTHfqPW
 Hlevq+r6cUaVY9aYvDhLpQ8yUCfGvBLyDfeIBBBteAGEjJbVEOos7Z6JSMV+rJZRime0
 Ra06fHLZIuOB4CS+iKp8oLyvGe0dvs/73RfzSrbheAd0v7pM3SnZTih060NRozjtW7ix
 ogiQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QVBVcyBvbmx5IHN1cHBvcnQgbW9kZTIgcmVzZXQuICBkR1BVcyB1c2UgZWl0aGVyIG1vZGUxIG9y
CmJhY28gZGVwZW5kaW5nIG9uIHZhcmlvdXMgY29uZGl0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMTcgKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jCmluZGV4IGY2N2VjZjgxNGM4Yy4uNDQwNWI5ODNkZDA5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTQ2NCwxMiArNDY0LDE0IEBAIHN0YXRpYyBpbnQgc29jMTVf
YXNpY19iYWNvX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwog
fQogCi1zdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCitzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCitzb2MxNV9hc2ljX3Jlc2V0X21ldGhv
ZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQlpbnQgcmV0OwogCWJvb2wgYmFjb19y
ZXNldDsKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CisJY2FzZSBDSElQX1JBVkVOOgor
CQlyZXR1cm4gQU1EX1JFU0VUX01FVEhPRF9NT0RFMjsKIAljYXNlIENISVBfVkVHQTEwOgogCWNh
c2UgQ0hJUF9WRUdBMTI6CiAJCXNvYzE1X2FzaWNfZ2V0X2JhY29fY2FwYWJpbGl0eShhZGV2LCAm
YmFjb19yZXNldCk7CkBAIC00OTMsNiArNDk1LDE2IEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19y
ZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl9CiAKIAlpZiAoYmFjb19yZXNldCkK
KwkJcmV0dXJuIEFNRF9SRVNFVF9NRVRIT0RfQkFDTzsKKwllbHNlCisJCXJldHVybiBBTURfUkVT
RVRfTUVUSE9EX01PREUxOworfQorCitzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaW50IHJldDsKKworCWlmIChzb2MxNV9hc2ljX3Jl
c2V0X21ldGhvZChhZGV2KSA9PSBBTURfUkVTRVRfTUVUSE9EX0JBQ08pCiAJCXJldCA9IHNvYzE1
X2FzaWNfYmFjb19yZXNldChhZGV2KTsKIAllbHNlCiAJCXJldCA9IHNvYzE1X2FzaWNfbW9kZTFf
cmVzZXQoYWRldik7CkBAIC04MDYsNiArODE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRn
cHVfYXNpY19mdW5jcyBzb2MxNV9hc2ljX2Z1bmNzID0KIAkucmVhZF9iaW9zX2Zyb21fcm9tID0g
JnNvYzE1X3JlYWRfYmlvc19mcm9tX3JvbSwKIAkucmVhZF9yZWdpc3RlciA9ICZzb2MxNV9yZWFk
X3JlZ2lzdGVyLAogCS5yZXNldCA9ICZzb2MxNV9hc2ljX3Jlc2V0LAorCS5yZXNldF9tZXRob2Qg
PSAmc29jMTVfYXNpY19yZXNldF9tZXRob2QsCiAJLnNldF92Z2Ffc3RhdGUgPSAmc29jMTVfdmdh
X3NldF9zdGF0ZSwKIAkuZ2V0X3hjbGsgPSAmc29jMTVfZ2V0X3hjbGssCiAJLnNldF91dmRfY2xv
Y2tzID0gJnNvYzE1X3NldF91dmRfY2xvY2tzLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
