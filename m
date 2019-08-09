Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7487EA6
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3B6EE53;
	Fri,  9 Aug 2019 15:53:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21FE6EE51
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:32 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 201so71935833qkm.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyDYX+CnA9yTO7oRd6BnULVwf4U9aSIQs/67mL9JaaQ=;
 b=rnYlUHGpdZf+UlMY57kNadLNGjJ6wWNM4dM/VTy8tyhyRCwfLhS47KIkKiY/5SS9PI
 tGas7IX8eVz/B4/u3CO/IhLmuVP1SNhFOopovcOf8zCQjhQ9eN7CcKWBYwKflKT29bsa
 8tDMbQ0YWXzlPDT5v+YhImCAb1kjEyWkw22BxlArApJ6MLfPcAzPS74tw9r4PqWvmCUt
 dn9tH/0Eszuxna1NxrtG1amsgmzmoGhnQ3QaqWGtm3yQeK368IcFapLsmuWH37w8s3Ob
 CmZo88+gjHmYETOxqPfBlM1iprnjd6Gs7DqA1VSOM1diz+jxEW5RPTky3rKKEoUm7b6+
 iBog==
X-Gm-Message-State: APjAAAX2+3/dWkYt4J+63egzjBfn9fy20QrJGh+uK3HYXTvXiz3R21LM
 UeZSx+jvny0lgOqmYeTWgjUh/6+f
X-Google-Smtp-Source: APXvYqxGH0WuuLinH/1QevYOrNE3QrkHi3qFWEHkf3IZl+giwhuPJFBpKpBPohPa5dJDM4jMFWulDg==
X-Received: by 2002:a37:6756:: with SMTP id b83mr16564159qkc.170.1565366011378; 
 Fri, 09 Aug 2019 08:53:31 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/27] drm/amdgpu: set fw default loading by psp for renoir
Date: Fri,  9 Aug 2019 10:52:59 -0500
Message-Id: <20190809155302.4733-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyDYX+CnA9yTO7oRd6BnULVwf4U9aSIQs/67mL9JaaQ=;
 b=usZFJ9gTli7Sy0qvCWkLuaub4txnsZCL8kuIGPSkbT03d6sDU4YGzrfcKKVUi6RD2o
 4L4doI2Hi+dAbUXZSkzpB/Vj/PUegIO/Lg+kCBTSd+0LYLRhgG0NyhXPL4V4Mbe6cKn0
 rGkNYsnR8b5+cddukqJIUcjFy5581cHRBy+XQx9RIyt7je4mK11trZKW1JLFcDDjiTJW
 zoBrWjtapAlY/yQq5dFaGo3hbL92lmeAp/ycdQR7wfOqgptJ77qQSgwBisL+HoUpzxlB
 Qc7rFRGO3SfuqF0iW2qCBTU9bQmglJGBmmJqmzZrntt18zQq3AKRrJqPzLFqEgCf+8kh
 zTPw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCkJ5IGRlZmF1bHQsIHNldCBhbWRn
cHUgdWNvZGUgdHlwZSB0byBBTURHUFVfRldfTE9BRF9QU1AuCgpTaWduZWQtb2ZmLWJ5OiBBYXJv
biBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5j
IHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jCmluZGV4IGVlNmE5
YmVlOGYwOC4uMzVmZDQ2YmRmYzUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdWNvZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdWNvZGUuYwpAQCAtMzYwLDYgKzM2MCw3IEBAIGFtZGdwdV91Y29kZV9nZXRfbG9hZF90eXBl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQogCWNhc2UgQ0hJUF9S
QVZFTjoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CisJY2FzZSBDSElQ
X1JFTk9JUjoKIAljYXNlIENISVBfTkFWSTEwOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJY2FzZSBD
SElQX05BVkkxMjoKQEAgLTM2OSwxMSArMzcwLDYgQEAgYW1kZ3B1X3Vjb2RlX2dldF9sb2FkX3R5
cGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsb2FkX3R5cGUpCiAJCQlyZXR1cm4g
QU1ER1BVX0ZXX0xPQURfUFNQOwogCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJcmV0dXJuIEFNREdQ
VV9GV19MT0FEX0RJUkVDVDsKLQljYXNlIENISVBfUkVOT0lSOgotCQlpZiAobG9hZF90eXBlID09
IEFNREdQVV9GV19MT0FEX1BTUCkKLQkJCXJldHVybiBBTURHUFVfRldfTE9BRF9QU1A7Ci0JCWVs
c2UKLQkJCXJldHVybiBBTURHUFVfRldfTE9BRF9ESVJFQ1Q7CiAKIAlkZWZhdWx0OgogCQlEUk1f
RVJST1IoIlVua25vd24gZmlybXdhcmUgbG9hZCB0eXBlXG4iKTsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
