Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6062C3AF5
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 09:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250196E975;
	Wed, 25 Nov 2020 08:23:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46D6E52A
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 10so84399wml.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzhA0w/k4kTJP8KS6ZWIOoU4RVum3eSvqAYOY6/W8wg=;
 b=CrS3VLKK9D1gUkCIA06uIjuxPlrWUCRwMEZOWxFbRV7fIAbtAAc/to7IXQeBff+VeI
 h0PjFmPQRxNRUwSruKjdKt4GFbQalr0csKiQsdY22z9hKPZZYSs1cA18dNWskDnWS44Z
 wMxwqfOMs6ujI/T/ZFnO/uUVEDzrorssQyIbqoGn+MIe6oeoRurZaEiXmb4kJOtwbyEP
 ryyDf+Q11Rpg/uk5lXWWFQKZgIMOydzVZyEuitEJh2BdPdwfxdKnfmb6n/bRqYCgR9TI
 jWlSwFHkmQeuviVAJ2SLH5jbKuAQAbxjt5ytBB5B/n7F34njf/oY59uCRF8oIllIOnYw
 wgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzhA0w/k4kTJP8KS6ZWIOoU4RVum3eSvqAYOY6/W8wg=;
 b=AdYsD+svm3Y7TsSht9mNrBrYfWXz8ya392Ig7S3gftobRf0GLAqSY3AY6b0U7D8dHN
 A3g3h5X335G4eTXIsuRBqwDWcZIrVr5+SRplwi1M/LyMHiPPohYRHaw7ImhfyHZdMRw6
 jfYg1REAVEPQzX5WoNwxNjgtZx+VNqIeMYRjO3EV/iqXU8OG2wRwnvXIS6yFdATdtGei
 5cUoMOaSxzzJnmcFkgasR/d+aPoM1ADjNsogQ7Xbfr8LtsRlbyx9/VHnz5Pd1djbJo9O
 jpnQLLspJ5lofz7wQjkjzKzWLPHcBDyO1E/0gfDBuq7OZzAxinxZQPSzjtLdEi1Xxitr
 ejMw==
X-Gm-Message-State: AOAM531F8c1ZYP0zq96o9/58Z67xB/WKxBP6KbQncsP1u0b3s3nCIM9D
 YAMJQAeIoZ9yCn1KJepgw+iv8Q==
X-Google-Smtp-Source: ABdhPJz/XlQqxXfWUnEWMz20ZEAn4PW7t6qvC5ObPEolRflflnVotMsK4efDfs9ws06qCyvrybXRDw==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr63586wmm.89.1606247076873; 
 Tue, 24 Nov 2020 11:44:36 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/40] drm/amd/amdgpu/jpeg_v1_0: Add some missing function
 param descriptions
Date: Tue, 24 Nov 2020 19:38:14 +0000
Message-Id: <20201124193824.1118741-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:22:58 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Veerabadhran G <vegopala@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6MjE5OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdhZGRyJyBub3QgZGVzY3JpYmVkIGluICdqcGVnX3YxXzBfZGVj
b2RlX3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFf
MC5jOjIxOTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnc2VxJyBub3Qg
ZGVzY3JpYmVkIGluICdqcGVnX3YxXzBfZGVjb2RlX3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jOjIxOTogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2pwZWdfdjFfMF9kZWNv
ZGVfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8w
LmM6MjE5OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdmZW5jZScgZGVzY3Jp
cHRpb24gaW4gJ2pwZWdfdjFfMF9kZWNvZGVfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6MjkzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNjcmliZWQgaW4gJ2pwZWdfdjFfMF9kZWNvZGVfcmlu
Z19lbWl0X2liJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmM6MjkzOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJl
ZCBpbiAnanBlZ192MV8wX2RlY29kZV9yaW5nX2VtaXRfaWInCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9qcGVnX3YxXzAuYzo1MTg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ21vZGUnIG5vdCBkZXNjcmliZWQgaW4gJ2pwZWdfdjFfMF9zdGFydCcKCkNjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFZlZXJhYmFk
aHJhbiBHIDx2ZWdvcGFsYUBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9qcGVnX3YxXzAuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2pwZWdfdjFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmMK
aW5kZXggYzYwMGI2MWI1ZjQ1ZC4uYzg3MTAyYjIzOGU0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvanBlZ192MV8wLmMKQEAgLTIxMCw3ICsyMTAsOSBAQCBzdGF0aWMgdm9pZCBqcGVnX3Yx
XzBfZGVjb2RlX3JpbmdfaW5zZXJ0X2VuZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAgKiBq
cGVnX3YxXzBfZGVjb2RlX3JpbmdfZW1pdF9mZW5jZSAtIGVtaXQgYW4gZmVuY2UgJiB0cmFwIGNv
bW1hbmQKICAqCiAgKiBAcmluZzogYW1kZ3B1X3JpbmcgcG9pbnRlcgotICogQGZlbmNlOiBmZW5j
ZSB0byBlbWl0CisgKiBAYWRkcjogYWRkcmVzcworICogQHNlcTogc2VxdWVuY2UgbnVtYmVyCisg
KiBAZmxhZ3M6IGZlbmNlIHJlbGF0ZWQgZmxhZ3MKICAqCiAgKiBXcml0ZSBhIGZlbmNlIGFuZCBh
IHRyYXAgY29tbWFuZCB0byB0aGUgcmluZy4KICAqLwpAQCAtMjgyLDcgKzI4NCw5IEBAIHN0YXRp
YyB2b2lkIGpwZWdfdjFfMF9kZWNvZGVfcmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdTY0IGFkZHIsCiAgKiBqcGVnX3YxXzBfZGVjb2RlX3JpbmdfZW1pdF9pYiAtIGV4
ZWN1dGUgaW5kaXJlY3QgYnVmZmVyCiAgKgogICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIK
KyAqIEBqb2I6IGpvYiB0byByZXRyaXZlIHZtaWQgZnJvbQogICogQGliOiBpbmRpcmVjdCBidWZm
ZXIgdG8gZXhlY3V0ZQorICogQGZsYWdzOiB1bnVzZWQKICAqCiAgKiBXcml0ZSByaW5nIGNvbW1h
bmRzIHRvIGV4ZWN1dGUgdGhlIGluZGlyZWN0IGJ1ZmZlci4KICAqLwpAQCAtNTExLDYgKzUxNSw3
IEBAIHZvaWQganBlZ192MV8wX3N3X2Zpbmkodm9pZCAqaGFuZGxlKQogICoganBlZ192MV8wX3N0
YXJ0IC0gc3RhcnQgSlBFRyBibG9jawogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50
ZXIKKyAqIEBtb2RlOiBTUEcgb3IgRFBHIG1vZGUKICAqCiAgKiBTZXR1cCBhbmQgc3RhcnQgdGhl
IEpQRUcgYmxvY2sKICAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
