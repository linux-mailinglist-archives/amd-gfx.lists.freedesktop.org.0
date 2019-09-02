Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3378A59F4
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 16:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C49289AAE;
	Mon,  2 Sep 2019 14:57:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DD789A7A
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 14:57:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d16so14934407wme.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Sep 2019 07:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ac7gVS/i9WG2O6GCHQCwqNSQq2dd4fFMpMXMsqfDwiI=;
 b=OyjgpcFGcTnPxC0VkInUaW5EgBF20FE2L/bqKUXM8NfHqPDi85AEwfpFmawE2mmUgx
 /kOgrZRg/CVrJZp74iaGfFq8+xdp1t0H39+SbRRnRZDYY69ubg73bqBWBN3gzPT3eKvd
 F9FwEK+E6HzBywcZuEG0plq1yxNfTD7pF1EHDBiT9RLvvo8/3AqAmf0pBdEi9lqAnZAw
 BMXwddtfCb007itKzlKgpm+EOZ+o6jFjqnkGLz1ay8ZdEhPA34HhAx3Ra1RJV8k5Sz1l
 pbG9V42vAMK96nJKiAv0YAwT0lvKtV3EFq+vLmYNlEa+KCNAAKTcktE2n2BlbKyxi5z7
 xntQ==
X-Gm-Message-State: APjAAAVSjCjm7R7gASi3xVv/kHrbgCEe1kWwjRjR7YAlxzaoFqCv+cA7
 0i3gK4yw8WjgGj/pxoZtq5JGMAmJ
X-Google-Smtp-Source: APXvYqwHvzvruAV1RK8FWKH5rrsFo0yukeewYsETZBJKEXeSDLfSKIZ/EOWbKxAtu1YF0MGleZPupg==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr36225898wmf.1.1567436255049;
 Mon, 02 Sep 2019 07:57:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:919b:1ba6:d244:e345])
 by smtp.gmail.com with ESMTPSA id d28sm12914573wrb.95.2019.09.02.07.57.34
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:57:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: cleanup PTE flag generation
Date: Mon,  2 Sep 2019 16:57:32 +0200
Message-Id: <20190902145732.2567-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190902145732.2567-1-christian.koenig@amd.com>
References: <20190902145732.2567-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ac7gVS/i9WG2O6GCHQCwqNSQq2dd4fFMpMXMsqfDwiI=;
 b=B4XWdpx+lyV49SRvAZh7//wRFQXI6SGIOKVT3Kd4BlhoflDBwUDY1xgmsd6Yo5kf88
 cjlwWsbuAmW2ZOjVOgwJPtl9k442koX0phgY8HoC6UatVNlinTLPBo8bsdwgneXfiCmC
 mKCi+7sa9crxEjgdxQp7I+ALNiafPMLu38FRUvXQWnhKfcD/3aj37XFbPoRdRnA5Zn1h
 AvtWg0NRtTWmHHEJX8l0OxacgLKJoX5JFLzwmO3UBdLXumVOH1BZ191doNqcwsFeRX2r
 UtCs5alVZ964+ShHrDSQ5sNGxstKIPnheVBDydnnXfR3nXu2Oj1rg14TzM0R8ip1AsAV
 2zbg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSB0aGUgQVNJQyBzcGVjaWZpYyBjb2RlIGludG8gYSBuZXcgY2FsbGJhY2sgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIHwgIDUgKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICB8IDI5ICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
ICB8IDIyICsrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192Nl8wLmMgICB8ICA5ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djdfMC5jICAgfCAxMSArKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djhfMC5jICAgfCAxMyArKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYyAgIHwgMjQgKysrKysrKysrKysrKysrKysrKy0KIDcgZmlsZXMgY2hhbmdlZCwgODIg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dtYy5oCmluZGV4IGQ1ZTQ1NzRhZmJjMi4uZDNiZTUxYmE2MzQ5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCkBAIC0xMDQsNiArMTA0LDEwIEBAIHN0cnVj
dCBhbWRncHVfZ21jX2Z1bmNzIHsKIAkvKiBnZXQgdGhlIHBkZSBmb3IgYSBnaXZlbiBtYyBhZGRy
ICovCiAJdm9pZCAoKmdldF92bV9wZGUpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQg
bGV2ZWwsCiAJCQkgICB1NjQgKmRzdCwgdTY0ICpmbGFncyk7CisJLyogZ2V0IHRoZSBwdGUgZmxh
Z3MgdG8gdXNlIGZvciBhIEJPIFZBIG1hcHBpbmcgKi8KKwl2b2lkICgqZ2V0X3ZtX3B0ZSkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkgICBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBp
bmcgKm1hcHBpbmcsCisJCQkgICB1aW50NjRfdCAqZmxhZ3MpOwogfTsKIAogc3RydWN0IGFtZGdw
dV94Z21pIHsKQEAgLTE4NSw2ICsxODksNyBAQCBzdHJ1Y3QgYW1kZ3B1X2dtYyB7CiAjZGVmaW5l
IGFtZGdwdV9nbWNfZW1pdF9wYXNpZF9tYXBwaW5nKHIsIHZtaWQsIHBhc2lkKSAociktPmFkZXYt
PmdtYy5nbWNfZnVuY3MtPmVtaXRfcGFzaWRfbWFwcGluZygociksICh2bWlkKSwgKHBhc2lkKSkK
ICNkZWZpbmUgYW1kZ3B1X2dtY19tYXBfbXR5cGUoYWRldiwgZmxhZ3MpIChhZGV2KS0+Z21jLmdt
Y19mdW5jcy0+bWFwX210eXBlKChhZGV2KSwoZmxhZ3MpKQogI2RlZmluZSBhbWRncHVfZ21jX2dl
dF92bV9wZGUoYWRldiwgbGV2ZWwsIGRzdCwgZmxhZ3MpIChhZGV2KS0+Z21jLmdtY19mdW5jcy0+
Z2V0X3ZtX3BkZSgoYWRldiksIChsZXZlbCksIChkc3QpLCAoZmxhZ3MpKQorI2RlZmluZSBhbWRn
cHVfZ21jX2dldF92bV9wdGUoYWRldiwgbWFwcGluZywgZmxhZ3MpIChhZGV2KS0+Z21jLmdtY19m
dW5jcy0+Z2V0X3ZtX3B0ZSgoYWRldiksIChtYXBwaW5nKSwgKGZsYWdzKSkKIAogLyoqCiAgKiBh
bWRncHVfZ21jX3ZyYW1fZnVsbF92aXNpYmxlIC0gQ2hlY2sgaWYgZnVsbCBWUkFNIGlzIHZpc2li
bGUgdGhyb3VnaCB0aGUgQkFSCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmlu
ZGV4IDJjYjgyYjIyOTgwMi4uYjI4NWFiMjUxNDZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYwpAQCAtMTU3MSwzMyArMTU3MSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zt
X2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaWYgKCEobWFw
cGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX1dSSVRFQUJMRSkpCiAJCWZsYWdzICY9IH5BTURHUFVf
UFRFX1dSSVRFQUJMRTsKIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9UT05HQSkgewot
CQlmbGFncyAmPSB+QU1ER1BVX1BURV9FWEVDVVRBQkxFOwotCQlmbGFncyB8PSBtYXBwaW5nLT5m
bGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKLQl9Ci0KLQlpZiAoYWRldi0+YXNpY190eXBl
ID49IENISVBfTkFWSTEwKSB7Ci0JCWZsYWdzICY9IH5BTURHUFVfUFRFX01UWVBFX05WMTBfTUFT
SzsKLQkJZmxhZ3MgfD0gKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9NVFlQRV9OVjEwX01B
U0spOwotCX0gZWxzZSB7Ci0JCWZsYWdzICY9IH5BTURHUFVfUFRFX01UWVBFX1ZHMTBfTUFTSzsK
LQkJZmxhZ3MgfD0gKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0sp
OwotCX0KLQotCWlmICgobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCkgJiYKLQkgICAg
KGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkpIHsKLQkJZmxhZ3MgfD0gQU1ER1BVX1BU
RV9QUlQ7Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9OQVZJMTApIHsKLQkJCWZsYWdz
IHw9IEFNREdQVV9QVEVfU05PT1BFRDsKLQkJCWZsYWdzIHw9IEFNREdQVV9QVEVfTE9HOwotCQkJ
ZmxhZ3MgfD0gQU1ER1BVX1BURV9TWVNURU07Ci0JCX0KLQkJZmxhZ3MgJj0gfkFNREdQVV9QVEVf
VkFMSUQ7Ci0JfQotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyAmJgotCSAg
ICAhKGZsYWdzICYgQU1ER1BVX1BURV9TWVNURU0pICYmCi0JICAgIG1hcHBpbmctPmJvX3ZhLT5p
c194Z21pKQotCQlmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7CisJLyogQXBwbHkgQVNJQyBz
cGVjaWZpYyBtYXBwaW5nIGZsYWdzICovCisJYW1kZ3B1X2dtY19nZXRfdm1fcHRlKGFkZXYsIG1h
cHBpbmcsICZmbGFncyk7CiAKIAl0cmFjZV9hbWRncHVfdm1fYm9fdXBkYXRlKG1hcHBpbmcpOwog
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCmluZGV4IDdlYjBiYTg3ZmVmOS4u
MWE4ZDhmNTI4YjAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwpAQCAt
NDQwLDEyICs0NDAsMzIgQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2dldF92bV9wZGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGdt
Y192MTBfMF9nZXRfdm1fcHRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCSBzdHJ1
Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsCisJCQkJIHVpbnQ2NF90ICpmbGFncykK
K3sKKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKKwkqZmxhZ3MgfD0gbWFwcGlu
Zy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFCTEU7CisKKwkqZmxhZ3MgJj0gfkFNREdQVV9Q
VEVfTVRZUEVfTlYxMF9NQVNLOworCSpmbGFncyB8PSAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVf
UFRFX01UWVBFX05WMTBfTUFTSyk7CisKKwlpZiAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRF
X1BSVCkgeworCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7CisJCSpmbGFncyB8PSBBTURHUFVf
UFRFX1NOT09QRUQ7CisJCSpmbGFncyB8PSBBTURHUFVfUFRFX0xPRzsKKwkJKmZsYWdzIHw9IEFN
REdQVV9QVEVfU1lTVEVNOworCQkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfVkFMSUQ7CisJfQorfQor
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3YxMF8wX2dtY19mdW5j
cyA9IHsKIAkuZmx1c2hfZ3B1X3RsYiA9IGdtY192MTBfMF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0
X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjEwXzBfZW1pdF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0X3Bh
c2lkX21hcHBpbmcgPSBnbWNfdjEwXzBfZW1pdF9wYXNpZF9tYXBwaW5nLAogCS5tYXBfbXR5cGUg
PSBnbWNfdjEwXzBfbWFwX210eXBlLAotCS5nZXRfdm1fcGRlID0gZ21jX3YxMF8wX2dldF92bV9w
ZGUKKwkuZ2V0X3ZtX3BkZSA9IGdtY192MTBfMF9nZXRfdm1fcGRlLAorCS5nZXRfdm1fcHRlID0g
Z21jX3YxMF8wX2dldF92bV9wdGUKIH07CiAKIHN0YXRpYyB2b2lkIGdtY192MTBfMF9zZXRfZ21j
X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192Nl8wLmMKaW5kZXggMmUzMDViMjFkYjY5Li5jZTU5MWM5OTU2OTEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwpAQCAtMzg5LDYgKzM4OSwxNCBAQCBzdGF0aWMgdm9p
ZCBnbWNfdjZfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2
ZWwsCiAJQlVHX09OKCphZGRyICYgMHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsKIH0KIAorc3RhdGlj
IHZvaWQgZ21jX3Y2XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJ
CQlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsCisJCQkJdWludDY0X3QgKmZs
YWdzKQoreworCUJVR19PTigqZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFCTEUpOworCUJVR19P
TigqZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCk7Cit9CisKIHN0YXRpYyB2b2lkIGdtY192Nl8wX3Nl
dF9mYXVsdF9lbmFibGVfZGVmYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJ
ICAgICAgYm9vbCB2YWx1ZSkKIHsKQEAgLTExNDQsNiArMTE1Miw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjZfMF9nbWNfZnVuY3MgPSB7CiAJLmVtaXRfZmx1
c2hfZ3B1X3RsYiA9IGdtY192Nl8wX2VtaXRfZmx1c2hfZ3B1X3RsYiwKIAkuc2V0X3BydCA9IGdt
Y192Nl8wX3NldF9wcnQsCiAJLmdldF92bV9wZGUgPSBnbWNfdjZfMF9nZXRfdm1fcGRlLAorCS5n
ZXRfdm1fcHRlID0gZ21jX3Y2XzBfZ2V0X3ZtX3B0ZSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ21jX3Y2XzBfaXJxX2Z1bmNzID0gewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192N18wLmMKaW5kZXggM2I3NzQyMTIzNGE3Li5lM2Y1M2ZiZmNkOGYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwpAQCAtNDY2LDYgKzQ2NiwxNCBA
QCBzdGF0aWMgdm9pZCBnbWNfdjdfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBpbnQgbGV2ZWwsCiAJQlVHX09OKCphZGRyICYgMHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsK
IH0KIAorc3RhdGljIHZvaWQgZ21jX3Y3XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKKwkJCQlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsCisJCQkJ
dWludDY0X3QgKmZsYWdzKQoreworCUJVR19PTigqZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFC
TEUpOworCUJVR19PTigqZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCk7Cit9CisKIC8qKgogICogZ21j
X3Y4XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0IC0gdXBkYXRlIFZNIGZhdWx0IGhhbmRsaW5n
CiAgKgpAQCAtMTMzOSw3ICsxMzQ3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21j
X2Z1bmNzIGdtY192N18wX2dtY19mdW5jcyA9IHsKIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21j
X3Y3XzBfZW1pdF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjdf
MF9lbWl0X3Bhc2lkX21hcHBpbmcsCiAJLnNldF9wcnQgPSBnbWNfdjdfMF9zZXRfcHJ0LAotCS5n
ZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3BkZQorCS5nZXRfdm1fcGRlID0gZ21jX3Y3XzBf
Z2V0X3ZtX3BkZSwKKwkuZ2V0X3ZtX3B0ZSA9IGdtY192N18wX2dldF92bV9wdGUKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ21jX3Y3XzBfaXJxX2Z1bmNz
ID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKaW5kZXggNTg0NDRhYTBhZjA1
Li4yNTZkMWZhYWNhZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwpAQCAt
Njg5LDYgKzY4OSwxNiBAQCBzdGF0aWMgdm9pZCBnbWNfdjhfMF9nZXRfdm1fcGRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBpbnQgbGV2ZWwsCiAJQlVHX09OKCphZGRyICYgMHhGRkZGRkYw
MDAwMDAwRkZGVUxMKTsKIH0KIAorc3RhdGljIHZvaWQgZ21jX3Y4XzBfZ2V0X3ZtX3B0ZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcg
Km1hcHBpbmcsCisJCQkJdWludDY0X3QgKmZsYWdzKQoreworCUJVR19PTigqZmxhZ3MgJiBBTURH
UFVfUFRFX1BSVCk7CisKKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKKwkqZmxh
Z3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFCTEU7Cit9CisKIC8qKgog
ICogZ21jX3Y4XzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0IC0gdXBkYXRlIFZNIGZhdWx0IGhh
bmRsaW5nCiAgKgpAQCAtMTcwNSw3ICsxNzE1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRn
cHVfZ21jX2Z1bmNzIGdtY192OF8wX2dtY19mdW5jcyA9IHsKIAkuZW1pdF9mbHVzaF9ncHVfdGxi
ID0gZ21jX3Y4XzBfZW1pdF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBn
bWNfdjhfMF9lbWl0X3Bhc2lkX21hcHBpbmcsCiAJLnNldF9wcnQgPSBnbWNfdjhfMF9zZXRfcHJ0
LAotCS5nZXRfdm1fcGRlID0gZ21jX3Y4XzBfZ2V0X3ZtX3BkZQorCS5nZXRfdm1fcGRlID0gZ21j
X3Y4XzBfZ2V0X3ZtX3BkZSwKKwkuZ2V0X3ZtX3B0ZSA9IGdtY192OF8wX2dldF92bV9wdGUKIH07
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ21jX3Y4XzBfaXJx
X2Z1bmNzID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggMjI2NjBl
MTAwNWRiLi5iM2QyZDcwZTg0YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YwpAQCAtNjI1LDEyICs2MjUsMzQgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBfZ2V0X3ZtX3BkZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLAogCX0KIH0KIAorc3RhdGljIHZv
aWQgZ21jX3Y5XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQlz
dHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsCisJCQkJdWludDY0X3QgKmZsYWdz
KQoreworCSpmbGFncyAmPSB+QU1ER1BVX1BURV9FWEVDVVRBQkxFOworCSpmbGFncyB8PSBtYXBw
aW5nLT5mbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsKKworCSpmbGFncyAmPSB+QU1ER1BV
X1BURV9NVFlQRV9WRzEwX01BU0s7CisJKmZsYWdzIHw9IG1hcHBpbmctPmZsYWdzICYgQU1ER1BV
X1BURV9NVFlQRV9WRzEwX01BU0s7CisKKwlpZiAobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRF
X1BSVCkgeworCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7CisJCSpmbGFncyAmPSB+QU1ER1BV
X1BURV9WQUxJRDsKKwl9CisKKwlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMg
JiYKKwkgICAgISgqZmxhZ3MgJiBBTURHUFVfUFRFX1NZU1RFTSkgJiYKKwkgICAgbWFwcGluZy0+
Ym9fdmEtPmlzX3hnbWkpCisJCSpmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7Cit9CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5jcyBnbWNfdjlfMF9nbWNfZnVuY3MgPSB7
CiAJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiLAogCS5lbWl0X2ZsdXNo
X2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCiAJLmVtaXRfcGFzaWRfbWFw
cGluZyA9IGdtY192OV8wX2VtaXRfcGFzaWRfbWFwcGluZywKIAkubWFwX210eXBlID0gZ21jX3Y5
XzBfbWFwX210eXBlLAotCS5nZXRfdm1fcGRlID0gZ21jX3Y5XzBfZ2V0X3ZtX3BkZQorCS5nZXRf
dm1fcGRlID0gZ21jX3Y5XzBfZ2V0X3ZtX3BkZSwKKwkuZ2V0X3ZtX3B0ZSA9IGdtY192OV8wX2dl
dF92bV9wdGUKIH07CiAKIHN0YXRpYyB2b2lkIGdtY192OV8wX3NldF9nbWNfZnVuY3Moc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
