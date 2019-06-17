Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A748E14
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78189623;
	Mon, 17 Jun 2019 19:18:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51B589612
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so6946706qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJ7OhpOEM4r9COgtbc/mwOvWK0mjHQk4mP+4r/Odgeo=;
 b=RZbgoQaV1L+H/Ehf6Ya0P48sX13jPRYFgyGx6yFPdC+Zp4R17ggVo7ItjYaQcSEo0P
 HX8HOuwhyUIbfufYgSHlvH2MhExY8gYREJkDVVgTz24JRqwNfSceivIJzNZ3B2f+xnJX
 N4kM7zMV8oAtrwwVvSQaHiCzBrO88DATOLBI/xhmcRWs8olTxvh4nlJ0huMTDNFf6bSm
 kp0TaARzc+j8W90fOqohtyGXfvdnBfTFH3vCip+GxUUOP2Tu0OWFMbRssoBGqlF/5X6K
 jiLKB7vejKug8uGcU9pZhF66Gr5TSYGlz8zs8NQi6MsfJk6Js50qCKhPQNbt3G0JjNrz
 K/Mg==
X-Gm-Message-State: APjAAAV3sxU7fomTwUwdaNDO0PVD8kbwwys/3ocoCL5cDjiGF8XeHoig
 sfRIWD3LLdnd7C2cuUTsdanPr09UBUg=
X-Google-Smtp-Source: APXvYqx0+FhEnUPPZ2veeGXIH7Fsw3mdYw8HPf2HITWu1zEWBhYX6gddylgJEJ1Oiv/HSdZfIZtHaA==
X-Received: by 2002:ae9:f101:: with SMTP id k1mr6442250qkg.337.1560799103821; 
 Mon, 17 Jun 2019 12:18:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 085/459] drm/amdgpu/psp11: skip ta firmware for navi10
Date: Mon, 17 Jun 2019 14:10:46 -0500
Message-Id: <20190617191700.17899-74-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJ7OhpOEM4r9COgtbc/mwOvWK0mjHQk4mP+4r/Odgeo=;
 b=aTpqbswq5Q0CsLOBBBNnMaDMBO7ZIiEtZfiSpxLJitG/PqU55f1g4/TDeRRneQS0JL
 y5/E71HSIeg+/dkC6/yTeRIZRpmuIj5FMmJHcW7gYJTTCZ0PlU9ou9yEKr0JWwkcO06c
 1Qp7ikPFrK7PFu5BM7eUK0iwD4MGV+wYZhqwTK5+Y5A61AiofUAMhzVyHRSJAlvr2x37
 NUVhr0/HmxdXhwuu5qhXEccwkeRG1tvPrdni8ZZVykrptFte9E6m7JWJoy92x8kE66ao
 O7dCG5imEx/Gzit+2MUZ0cEhAeohnKD91nyE8KEuM68TfG3LxHbcrgX0xkEdIjRyzFXK
 wxxA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCA1NCArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKaW5kZXggYjljOTU3ODdhZGI1Li4wZTcy
MzE0Y2MyNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFf
MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCkBAIC0xMjYs
MzAgKzEyNiwzNiBAQCBzdGF0aWMgaW50IHBzcF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3Qg
cHNwX2NvbnRleHQgKnBzcCkKIAlhZGV2LT5wc3AuYXNkX3N0YXJ0X2FkZHIgPSAodWludDhfdCAq
KWFzZF9oZHIgKwogCQkJCWxlMzJfdG9fY3B1KGFzZF9oZHItPmhlYWRlci51Y29kZV9hcnJheV9v
ZmZzZXRfYnl0ZXMpOwogCi0Jc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1k
Z3B1LyVzX3RhLmJpbiIsIGNoaXBfbmFtZSk7Ci0JZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRl
di0+cHNwLnRhX2Z3LCBmd19uYW1lLCBhZGV2LT5kZXYpOwotCWlmIChlcnIpIHsKLQkJcmVsZWFz
ZV9maXJtd2FyZShhZGV2LT5wc3AudGFfZncpOwotCQlhZGV2LT5wc3AudGFfZncgPSBOVUxMOwot
CQlkZXZfaW5mbyhhZGV2LT5kZXYsCi0JCQkgInBzcCB2MTEuMDogRmFpbGVkIHRvIGxvYWQgZmly
bXdhcmUgXCIlc1wiXG4iLCBmd19uYW1lKTsKLQl9IGVsc2UgewotCQllcnIgPSBhbWRncHVfdWNv
ZGVfdmFsaWRhdGUoYWRldi0+cHNwLnRhX2Z3KTsKLQkJaWYgKGVycikKLQkJCWdvdG8gb3V0MjsK
LQotCQl0YV9oZHIgPSAoY29uc3Qgc3RydWN0IHRhX2Zpcm13YXJlX2hlYWRlcl92MV8wICopYWRl
di0+cHNwLnRhX2Z3LT5kYXRhOwotCQlhZGV2LT5wc3AudGFfeGdtaV91Y29kZV92ZXJzaW9uID0g
bGUzMl90b19jcHUodGFfaGRyLT50YV94Z21pX3Vjb2RlX3ZlcnNpb24pOwotCQlhZGV2LT5wc3Au
dGFfeGdtaV91Y29kZV9zaXplID0gbGUzMl90b19jcHUodGFfaGRyLT50YV94Z21pX3NpemVfYnl0
ZXMpOwotCQlhZGV2LT5wc3AudGFfeGdtaV9zdGFydF9hZGRyID0gKHVpbnQ4X3QgKil0YV9oZHIg
KwotCQkJbGUzMl90b19jcHUodGFfaGRyLT5oZWFkZXIudWNvZGVfYXJyYXlfb2Zmc2V0X2J5dGVz
KTsKLQotCQlhZGV2LT5wc3AudGFfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1KHRhX2hkci0+aGVh
ZGVyLnVjb2RlX3ZlcnNpb24pOwotCi0JCWFkZXYtPnBzcC50YV9yYXNfdWNvZGVfdmVyc2lvbiA9
IGxlMzJfdG9fY3B1KHRhX2hkci0+dGFfcmFzX3Vjb2RlX3ZlcnNpb24pOwotCQlhZGV2LT5wc3Au
dGFfcmFzX3Vjb2RlX3NpemUgPSBsZTMyX3RvX2NwdSh0YV9oZHItPnRhX3Jhc19zaXplX2J5dGVz
KTsKLQkJYWRldi0+cHNwLnRhX3Jhc19zdGFydF9hZGRyID0gKHVpbnQ4X3QgKilhZGV2LT5wc3Au
dGFfeGdtaV9zdGFydF9hZGRyICsKLQkJCWxlMzJfdG9fY3B1KHRhX2hkci0+dGFfcmFzX29mZnNl
dF9ieXRlcyk7CisJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKKwljYXNlIENISVBfVkVHQTIw
OgorCQlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfdGEuYmlu
IiwgY2hpcF9uYW1lKTsKKwkJZXJyID0gcmVxdWVzdF9maXJtd2FyZSgmYWRldi0+cHNwLnRhX2Z3
LCBmd19uYW1lLCBhZGV2LT5kZXYpOworCQlpZiAoZXJyKSB7CisJCQlyZWxlYXNlX2Zpcm13YXJl
KGFkZXYtPnBzcC50YV9mdyk7CisJCQlhZGV2LT5wc3AudGFfZncgPSBOVUxMOworCQkJZGV2X2lu
Zm8oYWRldi0+ZGV2LAorCQkJCSAicHNwIHYxMS4wOiBGYWlsZWQgdG8gbG9hZCBmaXJtd2FyZSBc
IiVzXCJcbiIsIGZ3X25hbWUpOworCQl9IGVsc2UgeworCQkJZXJyID0gYW1kZ3B1X3Vjb2RlX3Zh
bGlkYXRlKGFkZXYtPnBzcC50YV9mdyk7CisJCQlpZiAoZXJyKQorCQkJCWdvdG8gb3V0MjsKKwor
CQkJdGFfaGRyID0gKGNvbnN0IHN0cnVjdCB0YV9maXJtd2FyZV9oZWFkZXJfdjFfMCAqKWFkZXYt
PnBzcC50YV9mdy0+ZGF0YTsKKwkJCWFkZXYtPnBzcC50YV94Z21pX3Vjb2RlX3ZlcnNpb24gPSBs
ZTMyX3RvX2NwdSh0YV9oZHItPnRhX3hnbWlfdWNvZGVfdmVyc2lvbik7CisJCQlhZGV2LT5wc3Au
dGFfeGdtaV91Y29kZV9zaXplID0gbGUzMl90b19jcHUodGFfaGRyLT50YV94Z21pX3NpemVfYnl0
ZXMpOworCQkJYWRldi0+cHNwLnRhX3hnbWlfc3RhcnRfYWRkciA9ICh1aW50OF90ICopdGFfaGRy
ICsKKwkJCQlsZTMyX3RvX2NwdSh0YV9oZHItPmhlYWRlci51Y29kZV9hcnJheV9vZmZzZXRfYnl0
ZXMpOworCQkJYWRldi0+cHNwLnRhX2Z3X3ZlcnNpb24gPSBsZTMyX3RvX2NwdSh0YV9oZHItPmhl
YWRlci51Y29kZV92ZXJzaW9uKTsKKwkJCWFkZXYtPnBzcC50YV9yYXNfdWNvZGVfdmVyc2lvbiA9
IGxlMzJfdG9fY3B1KHRhX2hkci0+dGFfcmFzX3Vjb2RlX3ZlcnNpb24pOworCQkJYWRldi0+cHNw
LnRhX3Jhc191Y29kZV9zaXplID0gbGUzMl90b19jcHUodGFfaGRyLT50YV9yYXNfc2l6ZV9ieXRl
cyk7CisJCQlhZGV2LT5wc3AudGFfcmFzX3N0YXJ0X2FkZHIgPSAodWludDhfdCAqKWFkZXYtPnBz
cC50YV94Z21pX3N0YXJ0X2FkZHIgKworCQkJCWxlMzJfdG9fY3B1KHRhX2hkci0+dGFfcmFzX29m
ZnNldF9ieXRlcyk7CisJCX0KKwkJYnJlYWs7CisJY2FzZSBDSElQX05BVkkxMDoKKwkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJQlVHKCk7CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
