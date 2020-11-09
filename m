Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6022AC715
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Nov 2020 22:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCC189683;
	Mon,  9 Nov 2020 21:21:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B957789568
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so5971948wrb.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QRM042GtogSyG7+rZpj/l/1G+WGXOLxnrrF/vvxVJY=;
 b=sYB8KKFz2Jqz6gYGNdkuwzwig/UrIQLC4jkCLB/qG9c32GQmE4Wy7/z/7UC1U4CeSQ
 NEY4vmIHF+LE5hK2gP1lO/VnKsVAJ3KPOH1xTVygdnTEjoMQtAS5asJdudEZYQlKonBX
 aZIvDgG3rHrWOd56KO+sOGIwnUpoxEvbrIcnCdfK8VZ5QgWCcyzY6XveCPguPjHOXu2z
 0vkc4atHMwUh62yCPRuO8EJXEGI5dwbF+p8xCPuf0obxUJqwvT8eTvFkMqjWITYwvX5W
 BoBbgWbPvlVD0L8Usa9WIcrRGNt/AY9Hi8zm0b5nPLL3+eAI2paSOfsc4E1dYVapf85+
 tfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QRM042GtogSyG7+rZpj/l/1G+WGXOLxnrrF/vvxVJY=;
 b=Hp2Ozqvwl+dQJDRoOy9olXLhf/xxfv6z9Gid17xnRfr+AYV4UVnbfcd7NaYskj0SFe
 fQ+m6NNhOXAXBiY0ITcM307KEDcwfhkiAggL8d3ueoTSZ7lCWvwQFB0G53XumrPn6GSo
 DNkkg2c5Q5W3UMEAu3CkaoGmSHW59VJB4wD9aQUC3ZA9FJ+UUfd1tDOY2Bc9mIeW87Go
 7iYiASbCl7IPkHVrFIxz/39cFVODvfR8RGufT0bFPCSLpkvrF04XtZnagKtADoCFjYDJ
 8UC1pYT2HaK0hD903AQbh3Wll8zZ/hAy3e+9AiP6/ySplKnp0koF1QG76KI+oam1AnKQ
 w0hA==
X-Gm-Message-State: AOAM530pZwg6MN1OZQpDWyBzRiITan9MDxToIXZ5NDvxJCPG0gNSIlFH
 yYVbcZrKEe1FUBBcSe1nuUJFpA==
X-Google-Smtp-Source: ABdhPJx+8D91GN4vBrp6RpD70yxFoPTEG4/f/iF2ytiqTOOf0RR6fQffoDlm+OFr+Y16Dp6eKwfNdA==
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr13463869wrp.2.1604956749484;
 Mon, 09 Nov 2020 13:19:09 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/20] drm/radeon/radeon_fence: Demote some non-conformant
 kernel-doc headers and fix another
Date: Mon,  9 Nov 2020 21:18:38 +0000
Message-Id: <20201109211855.3340030-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Nov 2020 21:21:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYzoxNjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3dhaXQnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9mZW5jZV9j
aGVja19zaWduYWxlZCcKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmM6MTY4
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtb2RlJyBub3QgZGVzY3Jp
YmVkIGluICdyYWRlb25fZmVuY2VfY2hlY2tfc2lnbmFsZWQnCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9mZW5jZS5jOjE2ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9mZW5jZV9jaGVja19zaWduYWxl
ZCcKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmM6MTY4OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdrZXknIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVv
bl9mZW5jZV9jaGVja19zaWduYWxlZCcKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Zl
bmNlLmM6MzkzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmJyBub3Qg
ZGVzY3JpYmVkIGluICdyYWRlb25fZmVuY2VfZW5hYmxlX3NpZ25hbGluZycKIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmM6MzkzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24g
cGFyYW1ldGVyICdmZW5jZScgZGVzY3JpcHRpb24gaW4gJ3JhZGVvbl9mZW5jZV9lbmFibGVfc2ln
bmFsaW5nJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVuY2UuYzoxMDEwOiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtJyBub3QgZGVzY3JpYmVkIGluICdy
YWRlb25fZGVidWdmc19ncHVfcmVzZXQnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9m
ZW5jZS5jOjEwMTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RhdGEn
IG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9kZWJ1Z2ZzX2dwdV9yZXNldCcKCkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdh
bCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJl
ZWRlc2t0b3Aub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZmVuY2UuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mZW5jZS5jCmluZGV4
IDg3MzViZjJiYjhiNWMuLjllZTZlNTk5ZWY4M2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2ZlbmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZmVuY2UuYwpAQCAtMTU3LDcgKzE1Nyw3IEBAIGludCByYWRlb25fZmVuY2VfZW1pdChzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAlyZXR1cm4gMDsKIH0KIAotLyoqCisvKgogICogcmFk
ZW9uX2ZlbmNlX2NoZWNrX3NpZ25hbGVkIC0gY2FsbGJhY2sgZnJvbSBmZW5jZV9xdWV1ZQogICoK
ICAqIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHdpdGggZmVuY2VfcXVldWUgbG9jayBoZWxkLCB3
aGljaCBpcyBhbHNvIHVzZWQKQEAgLTM4Myw3ICszODMsNyBAQCBzdGF0aWMgYm9vbCByYWRlb25f
ZmVuY2VfaXNfc2lnbmFsZWQoc3RydWN0IGRtYV9mZW5jZSAqZikKIAogLyoqCiAgKiByYWRlb25f
ZmVuY2VfZW5hYmxlX3NpZ25hbGluZyAtIGVuYWJsZSBzaWduYWxsaW5nIG9uIGZlbmNlCi0gKiBA
ZmVuY2U6IGZlbmNlCisgKiBAZjogZmVuY2UKICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxl
ZCB3aXRoIGZlbmNlX3F1ZXVlIGxvY2sgaGVsZCwgYW5kIGFkZHMgYSBjYWxsYmFjawogICogdG8g
ZmVuY2VfcXVldWUgdGhhdCBjaGVja3MgaWYgdGhpcyBmZW5jZSBpcyBzaWduYWxlZCwgYW5kIGlm
IHNvIGl0CkBAIC0xMDAxLDcgKzEwMDEsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9kZWJ1Z2ZzX2Zl
bmNlX2luZm8oc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQogCXJldHVybiAwOwogfQog
Ci0vKioKKy8qCiAgKiByYWRlb25fZGVidWdmc19ncHVfcmVzZXQgLSBtYW51YWxseSB0cmlnZ2Vy
IGEgZ3B1IHJlc2V0CiAgKgogICogTWFudWFsbHkgdHJpZ2dlciBhIGdwdSByZXNldCBhdCB0aGUg
bmV4dCBmZW5jZSB3YWl0LgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
