Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BD72715
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B266E440;
	Wed, 24 Jul 2019 05:00:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BE06E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d79so32836013qke.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFJL7vw6T5t9C3jPy0fDz7cWFh820iq0QVjaPZ+ZcEQ=;
 b=SybpTuHJtB4aW/57jwFhgj4Y05n2ZtOKl9vE6CZ8Si83Wir1ZUj+uy13UtiibMnBRK
 ue0pkC5KpviXgxy/H+hjY8q/kem2+K6CmoGeVY/3VvMduvHMWRAI1QHytjLj/FDLXlSJ
 TVU5NJcTN9S9GcOnyr+7vLEkP1m10bF6j0lB6oMqEd0EtLx92uIXDxRTDz0RX9YNPqh3
 Yw9KdyVhP2SCbynd9ChVnKw5S3Sw7YkyR0Rr7Ldcks25MYw2o13Sr9qVY39NR2CYsR5j
 QthQgelk3/ogCZyzg1ZeaxsZxg7oP5ZQ8/rsYnf1KXb64oW+jnZTBVhVXzDlwRy+zU7U
 AtbQ==
X-Gm-Message-State: APjAAAV9Rs5SjaGGORBD4n385XDqgwWeGJB7CBGwqvXZlO/VaEwFQbUO
 RlD3JkvIbj901cJLlkKasbGwScaB
X-Google-Smtp-Source: APXvYqxm+QV/snLvHLe+8kTjIybdrbPpwESnyMM565UYrjWrTpve6vDQTs30AthK63458NnDiyePbA==
X-Received: by 2002:a05:620a:232:: with SMTP id
 u18mr50895896qkm.131.1563944429296; 
 Tue, 23 Jul 2019 22:00:29 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 9/9] drm/amdgpu/powerplay/vega120: only use
 PrepareMp1ForUnload for mode1 reset
Date: Wed, 24 Jul 2019 00:00:12 -0500
Message-Id: <20190724050012.31398-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFJL7vw6T5t9C3jPy0fDz7cWFh820iq0QVjaPZ+ZcEQ=;
 b=Gl6AcmXKp7U9Z4ERCAYqNJibFRpq6xe5rr1/qDNJDwxVmIIcuGB/OXJ7EdI6NsMSu2
 aqe/5qS9i7gjsiqqXRF/QaVlVYqBmCYgyv1NmZL9KXRnlpMACUw2cc1JhHU391ROq1Pw
 atJxIROxjTZtY66t3mrJGWU0cpB0mME6YerKfIEXEtGKulsLVOQqKWMROsFctOiyLrwq
 oiSRQKIRAPXYYf6WkQiRKyGtlx/3W0Blu5OkWZwN1DvGwp2rTX3KU9ypoopNMnY5gAzo
 a1ulFz7hd2l1QYDbBZ+fXMwhWMYtWo91GmWGrj3eSQ+SX+RRVYGDITA1rsmSvADKFJC+
 Amfg==
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

VXNlIFByZXBhcmVNcDFGb3JVbmxvYWQgZm9yIG1vZGUxIHJlc2V0IGFuZCBQcmVwYXJlTXAxRm9y
U2h1dGRvd24gZm9yCmJhY28gcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMjBfaHdtZ3IuYyB8IDE4ICsrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwppbmRleCBlMTZkNjY1NDY5
MmYuLmMzZDJiMzJmMGI2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKQEAgLTM3NTYsNiArMzc1Niw3IEBAIHN0YXRpYyBpbnQg
dmVnYTIwX2Rpc2FibGVfZHBtX3Rhc2tzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiBzdGF0aWMg
aW50IHZlZ2EyMF9wb3dlcl9vZmZfYXNpYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewogCXN0
cnVjdCB2ZWdhMjBfaHdtZ3IgKmRhdGEgPSAoc3RydWN0IHZlZ2EyMF9od21nciAqKShod21nci0+
YmFja2VuZCk7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBod21nci0+YWRldjsKIAlp
bnQgcmVzdWx0OwogCiAJcmVzdWx0ID0gdmVnYTIwX2Rpc2FibGVfZHBtX3Rhc2tzKGh3bWdyKTsK
QEAgLTM3NjQsMTAgKzM3NjUsMTkgQEAgc3RhdGljIGludCB2ZWdhMjBfcG93ZXJfb2ZmX2FzaWMo
c3RydWN0IHBwX2h3bWdyICpod21ncikKIAkJCSk7CiAJZGF0YS0+d2F0ZXJfbWFya3NfYml0bWFw
ICY9IH4oV2F0ZXJNYXJrc0xvYWRlZCk7CiAKLQlQUF9BU1NFUlRfV0lUSF9DT0RFKChyZXN1bHQg
PSBzbXVtX3NlbmRfbXNnX3RvX3NtYyhod21nciwKLQkJCVBQU01DX01TR19QcmVwYXJlTXAxRm9y
VW5sb2FkKSkgPT0gMCwKLQkJCSJbUHJlcGFyZU1wMUZvclVubG9hZF0gRmFpbGVkISIsCi0JCQly
ZXR1cm4gcmVzdWx0KTsKKwlpZiAoYW1kZ3B1X2FzaWNfcmVzZXRfbWV0aG9kKGFkZXYpID09IEFN
RF9SRVNFVF9NRVRIT0RfTU9ERTEpIHsKKwkJUFBfQVNTRVJUX1dJVEhfQ09ERSgocmVzdWx0ID0K
KwkJCQkgICAgIHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLAorCQkJCQkJCSAgUFBTTUNfTVNH
X1ByZXBhcmVNcDFGb3JVbmxvYWQpKSA9PSAwLAorCQkJCSAgICAiW1ByZXBhcmVNcDFGb3JVbmxv
YWRdIEZhaWxlZCEiLAorCQkJCSAgICByZXR1cm4gcmVzdWx0KTsKKwl9IGVsc2UgeworCQlQUF9B
U1NFUlRfV0lUSF9DT0RFKChyZXN1bHQgPQorCQkJCSAgICAgc211bV9zZW5kX21zZ190b19zbWMo
aHdtZ3IsCisJCQkJCQkJICBQUFNNQ19NU0dfUHJlcGFyZU1wMUZvclNodXRkb3duKSkgPT0gMCwK
KwkJCQkgICAgIltQcmVwYXJlTXAxRm9yVW5sb2FkXSBGYWlsZWQhIiwKKwkJCQkgICAgcmV0dXJu
IHJlc3VsdCk7CisJfQogCiAJcmV0dXJuIHJlc3VsdDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
