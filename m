Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C2C2C0C77
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236BE89FF9;
	Mon, 23 Nov 2020 13:58:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C864989683
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r17so18255067wrw.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PNe63QSqzIOAFvdSbqBBH6uw9VqajeEy9sWGo6R4j8=;
 b=RkBlQJ+x9SNdFfBeEkr2mAFd8dPH3dHViN3an5nL1lfDEtE8Ms781sckHN9wr1zfPF
 QH4M6289hISdlts3trLSL9NjeSCocAVH3PL0PeOA6yiCAiLa3J7800lTw7SBnc/MSXij
 ljx1o4MioROT8koCwq12c3xujT9/x5l6uzBGF1rbw7/hk769ARygvSLHjpcJeJ5wHrsQ
 A371zGosGvD2MqhEADydkPWY2VRFPcgRuq6Uy3gDRky4wqWJJZ+Q0CpRWcbL68yZGbZb
 Qv6BrPxHDbcA/GKs9E5ttFN/tP2LXxOlrrfPaXp+bZuB4MzmvGSpOyD1FeCp5mDubxMZ
 Dfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PNe63QSqzIOAFvdSbqBBH6uw9VqajeEy9sWGo6R4j8=;
 b=pgkOjQcjTUDJuMzrxEe0RYw5qasIrIfQfFzhPjAx9xIhScKJBvQeDfv+2OoaQHXAX7
 XKC3TC8o/ubmkhlmSslVm7FJ/u9Y6ING2SYxuAxdIeh10d8LWtrItqetLPDaV8AjqJ55
 MZFFWHMxiy9EYMOQamNFu3WH/5CBrJfFRvkM5SH8nF/1m0JHUnFh+N2EBlCBDuhBWTqN
 TniPUOI+CTSBKypOEHcZ2uLRb7250q+gtLVnxwDGPde7qiW0Fa5t8+XBzvne419VyfdI
 adF3S47E5/0eSoIZCDhPrxgGMe2vuUVnN1wlEtUhMtnrtFJeGNE3io6fOZ9NabF52gn/
 peBA==
X-Gm-Message-State: AOAM531kdtuZ4lZH9u78LcRYvX+C6SGVdvAp7yVQzsJ72zSyBTh19pYu
 buNIT2A807IesraoBd7XLb6U1muirKDIakVN
X-Google-Smtp-Source: ABdhPJwSKmJHEX1mXlW2JuUsWqIDGkeXjFRx8CpJ8HKWMw8t83ENQo6yULtw8+eKHfudo7CAaD+FQA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr115694wro.415.1606130374503; 
 Mon, 23 Nov 2020 03:19:34 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/amd/amdgpu/gfx_v7_0: Clean-up a bunch of kernel-doc
 related issues
Date: Mon, 23 Nov 2020 11:18:48 +0000
Message-Id: <20201123111919.233376-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:58:01 +0000
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
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzoxNTkwOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpbnN0YW5jZScgbm90IGRlc2NyaWJlZCBpbiAnZ2Z4X3Y3XzBf
c2VsZWN0X3NlX3NoJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzoxNzg4
OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdzZV9udW0nIGRlc2NyaXB0aW9u
IGluICdnZnhfdjdfMF9zZXR1cF9yYicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
N18wLmM6MTc4ODogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnc2hfcGVyX3Nl
JyBkZXNjcmlwdGlvbiBpbiAnZ2Z4X3Y3XzBfc2V0dXBfcmInCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjdfMC5jOjE4NTI6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0
ZXIgJ2FkZXYnIGRlc2NyaXB0aW9uIGluICdERUZBVUxUX1NIX01FTV9CQVNFUycKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmM6MjA4Njogd2FybmluZzogRXhjZXNzIGZ1bmN0
aW9uIHBhcmFtZXRlciAnYWRldicgZGVzY3JpcHRpb24gaW4gJ2dmeF92N18wX3JpbmdfdGVzdF9y
aW5nJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzoyMTMwOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdyaW5nJyBub3QgZGVzY3JpYmVkIGluICdn
ZnhfdjdfMF9yaW5nX2VtaXRfaGRwX2ZsdXNoJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYzoyMTMwOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdhZGV2
JyBkZXNjcmlwdGlvbiBpbiAnZ2Z4X3Y3XzBfcmluZ19lbWl0X2hkcF9mbHVzaCcKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmM6MjEzMDogd2FybmluZzogRXhjZXNzIGZ1bmN0
aW9uIHBhcmFtZXRlciAncmlkeCcgZGVzY3JpcHRpb24gaW4gJ2dmeF92N18wX3JpbmdfZW1pdF9o
ZHBfZmx1c2gnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjIxODI6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3JpbmcnIG5vdCBkZXNjcmliZWQg
aW4gJ2dmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9nZngnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjdfMC5jOjIxODI6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ2dmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9nZngn
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjIxODI6IHdhcm5pbmc6IEZ1
bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3NlcScgbm90IGRlc2NyaWJlZCBpbiAnZ2Z4X3Y3
XzBfcmluZ19lbWl0X2ZlbmNlX2dmeCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
N18wLmM6MjE4Mjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZmxhZ3Mn
IG5vdCBkZXNjcmliZWQgaW4gJ2dmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9nZngnCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjIxODI6IHdhcm5pbmc6IEV4Y2VzcyBmdW5j
dGlvbiBwYXJhbWV0ZXIgJ2FkZXYnIGRlc2NyaXB0aW9uIGluICdnZnhfdjdfMF9yaW5nX2VtaXRf
ZmVuY2VfZ2Z4JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzoyMTgyOiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdmZW5jZScgZGVzY3JpcHRpb24gaW4g
J2dmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9nZngnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjdfMC5jOjIyMjQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J3JpbmcnIG5vdCBkZXNjcmliZWQgaW4gJ2dmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9jb21wdXRl
JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzoyMjI0OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhZGRyJyBub3QgZGVzY3JpYmVkIGluICdnZnhf
djdfMF9yaW5nX2VtaXRfZmVuY2VfY29tcHV0ZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92N18wLmM6MjIyNDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
c2VxJyBub3QgZGVzY3JpYmVkIGluICdnZnhfdjdfMF9yaW5nX2VtaXRfZmVuY2VfY29tcHV0ZScK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmM6MjIyNDogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2dmeF92
N18wX3JpbmdfZW1pdF9mZW5jZV9jb21wdXRlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYzoyMjI0OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdhZGV2
JyBkZXNjcmlwdGlvbiBpbiAnZ2Z4X3Y3XzBfcmluZ19lbWl0X2ZlbmNlX2NvbXB1dGUnCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjIyMjQ6IHdhcm5pbmc6IEV4Y2VzcyBm
dW5jdGlvbiBwYXJhbWV0ZXIgJ2ZlbmNlJyBkZXNjcmlwdGlvbiBpbiAnZ2Z4X3Y3XzBfcmluZ19l
bWl0X2ZlbmNlX2NvbXB1dGUnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5j
OjIyNjA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2pvYicgbm90IGRl
c2NyaWJlZCBpbiAnZ2Z4X3Y3XzBfcmluZ19lbWl0X2liX2dmeCcKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92N18wLmM6MjI2MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ2dmeF92N18wX3JpbmdfZW1pdF9pYl9n
ZngnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjIzNTE6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3RpbWVvdXQnIG5vdCBkZXNjcmliZWQgaW4g
J2dmeF92N18wX3JpbmdfdGVzdF9pYicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
N18wLmM6MzI0NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmluZycg
bm90IGRlc2NyaWJlZCBpbiAnZ2Z4X3Y3XzBfcmluZ19lbWl0X3ZtX2ZsdXNoJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzozMjQ0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICd2bWlkJyBub3QgZGVzY3JpYmVkIGluICdnZnhfdjdfMF9yaW5nX2Vt
aXRfdm1fZmx1c2gnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jOjMyNDQ6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3BkX2FkZHInIG5vdCBkZXNj
cmliZWQgaW4gJ2dmeF92N18wX3JpbmdfZW1pdF92bV9mbHVzaCcKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92N18wLmM6MzI0NDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFt
ZXRlciAnYWRldicgZGVzY3JpcHRpb24gaW4gJ2dmeF92N18wX3JpbmdfZW1pdF92bV9mbHVzaCcK
CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFy
by5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jIHwgMzMgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMKaW5kZXggMDRlMWU5
MmY1ZjNjZi4uZjI0OTBmOTE1YThiZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdf
MC5jCkBAIC0xNTgwLDEwICsxNTgwLDEwIEBAIHN0YXRpYyB2b2lkIGdmeF92N18wX3RpbGluZ19t
b2RlX3RhYmxlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBAYWRldjogYW1k
Z3B1X2RldmljZSBwb2ludGVyCiAgKiBAc2VfbnVtOiBzaGFkZXIgZW5naW5lIHRvIGFkZHJlc3MK
ICAqIEBzaF9udW06IHNoIGJsb2NrIHRvIGFkZHJlc3MKKyAqIEBpbnN0YW5jZTogQ2VydGFpbiBy
ZWdpc3RlcnMgYXJlIGluc3RhbmNlZCBwZXIgU0Ugb3IgU0guCisgKiAgICAgICAgICAgIDB4ZmZm
ZmZmZmYgbWVhbnMgYnJvYWRjYXN0IHRvIGFsbCBTRXMgb3IgU0hzIChDSUspLgogICoKLSAqIFNl
bGVjdCB3aGljaCBTRSwgU0ggY29tYmluYXRpb25zIHRvIGFkZHJlc3MuIENlcnRhaW4KLSAqIHJl
Z2lzdGVycyBhcmUgaW5zdGFuY2VkIHBlciBTRSBvciBTSC4gIDB4ZmZmZmZmZmYgbWVhbnMKLSAq
IGJyb2FkY2FzdCB0byBhbGwgU0VzIG9yIFNIcyAoQ0lLKS4KKyAqIFNlbGVjdCB3aGljaCBTRSwg
U0ggY29tYmluYXRpb25zIHRvIGFkZHJlc3MuCiAgKi8KIHN0YXRpYyB2b2lkIGdmeF92N18wX3Nl
bGVjdF9zZV9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgIHUzMiBzZV9udW0s
IHUzMiBzaF9udW0sIHUzMiBpbnN0YW5jZSkKQEAgLTE3NzksOCArMTc3OSw2IEBAIGdmeF92N18w
X3dyaXRlX2hhcnZlc3RlZF9yYXN0ZXJfY29uZmlncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKICAqIGdmeF92N18wX3NldHVwX3JiIC0gc2V0dXAgdGhlIFJCcyBvbiB0aGUgYXNpYwogICoK
ICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKLSAqIEBzZV9udW06IG51bWJlciBvZiBT
RXMgKHNoYWRlciBlbmdpbmVzKSBmb3IgdGhlIGFzaWMKLSAqIEBzaF9wZXJfc2U6IG51bWJlciBv
ZiBTSCBibG9ja3MgcGVyIFNFIGZvciB0aGUgYXNpYwogICoKICAqIENvbmZpZ3VyZXMgcGVyLVNF
L1NIIFJCIHJlZ2lzdGVycyAoQ0lLKS4KICAqLwpAQCAtMTg0MSw2ICsxODM5LDcgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3Y3XzBfc2V0dXBfcmIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJbXV0
ZXhfdW5sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7CiB9CiAKKyNkZWZpbmUgREVGQVVMVF9T
SF9NRU1fQkFTRVMJKDB4NjAwMCkKIC8qKgogICogZ2Z4X3Y3XzBfaW5pdF9jb21wdXRlX3ZtaWQg
LSBnYXJ0IGVuYWJsZQogICoKQEAgLTE4NDksNyArMTg0OCw2IEBAIHN0YXRpYyB2b2lkIGdmeF92
N18wX3NldHVwX3JiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogICogSW5pdGlhbGl6ZSBj
b21wdXRlIHZtaWQgc2hfbWVtIHJlZ2lzdGVycwogICoKICAqLwotI2RlZmluZSBERUZBVUxUX1NI
X01FTV9CQVNFUwkoMHg2MDAwKQogc3RhdGljIHZvaWQgZ2Z4X3Y3XzBfaW5pdF9jb21wdXRlX3Zt
aWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJaW50IGk7CkBAIC0yMDc0LDcgKzIw
NzIsNiBAQCBzdGF0aWMgdm9pZCBnZnhfdjdfMF9zY3JhdGNoX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAvKioKICAqIGdmeF92N18wX3JpbmdfdGVzdF9yaW5nIC0gYmFzaWMgZ2Z4
IHJpbmcgdGVzdAogICoKLSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKICAqIEByaW5n
OiBhbWRncHVfcmluZyBzdHJ1Y3R1cmUgaG9sZGluZyByaW5nIGluZm9ybWF0aW9uCiAgKgogICog
QWxsb2NhdGUgYSBzY3JhdGNoIHJlZ2lzdGVyIGFuZCB3cml0ZSB0byBpdCB1c2luZyB0aGUgZ2Z4
IHJpbmcgKENJSykuCkBAIC0yMTIxLDggKzIxMTgsNyBAQCBzdGF0aWMgaW50IGdmeF92N18wX3Jp
bmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIC8qKgogICogZ2Z4X3Y3XzBf
cmluZ19lbWl0X2hkcCAtIGVtaXQgYW4gaGRwIGZsdXNoIG9uIHRoZSBjcAogICoKLSAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKLSAqIEByaWR4OiBhbWRncHUgcmluZyBpbmRleAorICog
QHJpbmc6IGFtZGdwdV9yaW5nIHN0cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRpb24KICAq
CiAgKiBFbWl0cyBhbiBoZHAgZmx1c2ggb24gdGhlIGNwLgogICovCkBAIC0yMTcxLDggKzIxNjcs
MTAgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y3XzBfcmluZ19lbWl0X3ZndF9mbHVzaChzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcpCiAvKioKICAqIGdmeF92N18wX3JpbmdfZW1pdF9mZW5jZV9nZnggLSBl
bWl0IGEgZmVuY2Ugb24gdGhlIGdmeCByaW5nCiAgKgotICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgotICogQGZlbmNlOiBhbWRncHUgZmVuY2Ugb2JqZWN0CisgKiBAcmluZzogYW1kZ3B1
X3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgorICogQGFkZHI6IGFkZHJl
c3MKKyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlcgorICogQGZsYWdzOiBmZW5jZSByZWxhdGVkIGZs
YWdzCiAgKgogICogRW1pdHMgYSBmZW5jZSBzZXF1bmNlIG51bWJlciBvbiB0aGUgZ2Z4IHJpbmcg
YW5kIGZsdXNoZXMKICAqIEdQVSBjYWNoZXMuCkBAIC0yMjEyLDggKzIyMTAsMTAgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3Y3XzBfcmluZ19lbWl0X2ZlbmNlX2dmeChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsIHU2NCBhZGRyLAogLyoqCiAgKiBnZnhfdjdfMF9yaW5nX2VtaXRfZmVuY2VfY29tcHV0ZSAt
IGVtaXQgYSBmZW5jZSBvbiB0aGUgY29tcHV0ZSByaW5nCiAgKgotICogQGFkZXY6IGFtZGdwdV9k
ZXZpY2UgcG9pbnRlcgotICogQGZlbmNlOiBhbWRncHUgZmVuY2Ugb2JqZWN0CisgKiBAcmluZzog
YW1kZ3B1X3Jpbmcgc3RydWN0dXJlIGhvbGRpbmcgcmluZyBpbmZvcm1hdGlvbgorICogQGFkZHI6
IGFkZHJlc3MKKyAqIEBzZXE6IHNlcXVlbmNlIG51bWJlcgorICogQGZsYWdzOiBmZW5jZSByZWxh
dGVkIGZsYWdzCiAgKgogICogRW1pdHMgYSBmZW5jZSBzZXF1bmNlIG51bWJlciBvbiB0aGUgY29t
cHV0ZSByaW5nIGFuZCBmbHVzaGVzCiAgKiBHUFUgY2FjaGVzLgpAQCAtMjI0NSw3ICsyMjQ1LDkg
QEAgc3RhdGljIHZvaWQgZ2Z4X3Y3XzBfcmluZ19lbWl0X2ZlbmNlX2NvbXB1dGUoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLAogICogZ2Z4X3Y3XzBfcmluZ19lbWl0X2liIC0gZW1pdCBhbiBJQiAo
SW5kaXJlY3QgQnVmZmVyKSBvbiB0aGUgcmluZwogICoKICAqIEByaW5nOiBhbWRncHVfcmluZyBz
dHJ1Y3R1cmUgaG9sZGluZyByaW5nIGluZm9ybWF0aW9uCisgKiBAam9iOiBqb2IgdG8gcmV0cml2
ZSB2bWlkIGZyb20KICAqIEBpYjogYW1kZ3B1IGluZGlyZWN0IGJ1ZmZlciBvYmplY3QKKyAqIEBm
bGFnczogb3B0aW9ucyAoQU1ER1BVX0hBVkVfQ1RYX1NXSVRDSCkKICAqCiAgKiBFbWl0cyBhbiBE
RSAoZHJhd2luZyBlbmdpbmUpIG9yIENFIChjb25zdGFudCBlbmdpbmUpIElCCiAgKiBvbiB0aGUg
Z2Z4IHJpbmcuICBJQnMgYXJlIHVzdWFsbHkgZ2VuZXJhdGVkIGJ5IHVzZXJzcGFjZQpAQCAtMjM0
Miw2ICsyMzQ0LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y3X3JpbmdfZW1pdF9jbnR4Y250bChzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGZsYWdzKQogICogZ2Z4X3Y3XzBfcmluZ190
ZXN0X2liIC0gYmFzaWMgcmluZyBJQiB0ZXN0CiAgKgogICogQHJpbmc6IGFtZGdwdV9yaW5nIHN0
cnVjdHVyZSBob2xkaW5nIHJpbmcgaW5mb3JtYXRpb24KKyAqIEB0aW1lb3V0OiB0aW1lb3V0IHZh
bHVlIGluIGppZmZpZXMsIG9yIE1BWF9TQ0hFRFVMRV9USU1FT1VUCiAgKgogICogQWxsb2NhdGUg
YW4gSUIgYW5kIGV4ZWN1dGUgaXQgb24gdGhlIGdmeCByaW5nIChDSUspLgogICogUHJvdmlkZXMg
YSBiYXNpYyBnZnggcmluZyB0ZXN0IHRvIHZlcmlmeSB0aGF0IElCcyBhcmUgd29ya2luZy4KQEAg
LTMyMzQsNyArMzIzNyw5IEBAIHN0YXRpYyB2b2lkIGdmeF92N18wX3JpbmdfZW1pdF9waXBlbGlu
ZV9zeW5jKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIC8qKgogICogZ2Z4X3Y3XzBfcmluZ19l
bWl0X3ZtX2ZsdXNoIC0gY2lrIHZtIGZsdXNoIHVzaW5nIHRoZSBDUAogICoKLSAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqIEByaW5nOiBhbWRncHVfcmluZyBwb2ludGVyCisgKiBA
dm1pZDogdm1pZCBudW1iZXIgdG8gdXNlCisgKiBAcGRfYWRkcjogYWRkcmVzcwogICoKICAqIFVw
ZGF0ZSB0aGUgcGFnZSB0YWJsZSBiYXNlIGFuZCBmbHVzaCB0aGUgVk0gVExCCiAgKiB1c2luZyB0
aGUgQ1AgKENJSykuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
