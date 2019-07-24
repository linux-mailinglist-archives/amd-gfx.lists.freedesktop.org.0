Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8A72711
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE316E441;
	Wed, 24 Jul 2019 05:00:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A456E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so7195518qka.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wr0POmGbOdHgGXa95CzXmbUEq3fAV7hLuTRvBkGGAbQ=;
 b=hgU3eN3BN6e/CjEvPB+loi7l0WBQ1Xwf0MHBizKPDkX4663eiX6RpH7V2QBwj3Dk+q
 ek5F/mf6N8xkUjb1uyeKRj+8Gk8oc+dn8are+GgSzYXksykg/DPtEzFLFs8lsIPt63/g
 Ti78e8db0QABGRceAy+imXDxXS8vicH4XrN3M/0bStJYP3i3Kt64JsWYKiq38fRLPeYL
 EpFr1+TmV9uhIXI0QJeioVxWGz3BQ7ct62czenq9LIQsKJWwAshd4KJOYEBbb8gPFSw7
 FAF9hHpqjTygENcUgikSwIesANUmS3EgEXyecpxUtB1a7VgY4s6d9bxwj7nhfqBgqJf+
 KwvQ==
X-Gm-Message-State: APjAAAVk6NbO1oHYNMrWfTHkT2/ALXzlkPv4jsuIfGmuZYhxjcaCaToZ
 +cgr2JztOD7oY0ya9JGknshYlODa
X-Google-Smtp-Source: APXvYqxn6vIJBp6bMIDFg8MpDDANtNBWXXK1gQS8kJ23fRfQQRJx5vFlCNohbGd8XCzapbhFyclazQ==
X-Received: by 2002:a37:4914:: with SMTP id w20mr52195341qka.156.1563944426999; 
 Tue, 23 Jul 2019 22:00:26 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: add reset_method asic callback for navi
Date: Wed, 24 Jul 2019 00:00:09 -0500
Message-Id: <20190724050012.31398-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wr0POmGbOdHgGXa95CzXmbUEq3fAV7hLuTRvBkGGAbQ=;
 b=XcPzZemvymnd0XGT4sR+6R3FHJVSNM+nw/GEKwq1U0h++J+7bg2sjqAJrE+FFLDQ7l
 Cpc3sNgfgDZ5UHXaP0d24AGVovMfHfxs0TAgnlkXtyryETtmZgCXVRDNGlRhnf3kB1EL
 2piJVCu8H7bOgI504hMsKLwZ5qSoNsaeWciE90g7TM+L1RUserBuJPxHuqSyNwXXR7UN
 RxkML91E87UAlhMSJC0F+IYCFYghR8SFJYp2gafFsgM02CDgaWUkzE4kQNtIBiOcNR2w
 ATGMnuU2FHbqilMlFtPFpR2AxBNwWnWsjQi5iq/ywTRXrkUUdJ53Ipal4vHk3zsM7t/Y
 p2jg==
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

TmF2aSB1c2VzIGVpdGhlciBtb2RlMSBvciBiYWNvIGRlcGVuZGluZyBvbiB2YXJpb3VzCmNvbmRp
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDE1ICsrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCA2YzU5YjY0YjliYjEuLmJmNGNiY2RlZWY3OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC0yODksNiArMjg5LDE4IEBAIHN0YXRpYyBpbnQg
bnZfYXNpY19tb2RlMV9yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCXJldHVy
biByZXQ7CiB9CisKK3N0YXRpYyBlbnVtIGFtZF9yZXNldF9tZXRob2QKK252X2FzaWNfcmVzZXRf
bWV0aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCBzbXVfY29udGV4
dCAqc211ID0gJmFkZXYtPnNtdTsKKworCWlmIChzbXVfYmFjb19pc19zdXBwb3J0KHNtdSkpCisJ
CXJldHVybiBBTURfUkVTRVRfTUVUSE9EX0JBQ087CisJZWxzZQorCQlyZXR1cm4gQU1EX1JFU0VU
X01FVEhPRF9NT0RFMTsKK30KKwogc3RhdGljIGludCBudl9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogewogCkBAIC0zMDMsNyArMzE1LDcgQEAgc3RhdGljIGludCBudl9h
c2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWludCByZXQgPSAwOwogCXN0
cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKIAotCWlmIChzbXVfYmFjb19pc19z
dXBwb3J0KHNtdSkpCisJaWYgKG52X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYpID09IEFNRF9SRVNF
VF9NRVRIT0RfQkFDTykKIAkJcmV0ID0gc211X2JhY29fcmVzZXQoc211KTsKIAllbHNlCiAJCXJl
dCA9IG52X2FzaWNfbW9kZTFfcmVzZXQoYWRldik7CkBAIC01MDAsNiArNTEyLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyBudl9hc2ljX2Z1bmNzID0KIAkucmVhZF9i
aW9zX2Zyb21fcm9tID0gJm52X3JlYWRfYmlvc19mcm9tX3JvbSwKIAkucmVhZF9yZWdpc3RlciA9
ICZudl9yZWFkX3JlZ2lzdGVyLAogCS5yZXNldCA9ICZudl9hc2ljX3Jlc2V0LAorCS5yZXNldF9t
ZXRob2QgPSAmbnZfYXNpY19yZXNldF9tZXRob2QsCiAJLnNldF92Z2Ffc3RhdGUgPSAmbnZfdmdh
X3NldF9zdGF0ZSwKIAkuZ2V0X3hjbGsgPSAmbnZfZ2V0X3hjbGssCiAJLnNldF91dmRfY2xvY2tz
ID0gJm52X3NldF91dmRfY2xvY2tzLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
