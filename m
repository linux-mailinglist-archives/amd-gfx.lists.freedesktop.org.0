Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E252C0C75
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262A89FF6;
	Mon, 23 Nov 2020 13:58:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2BF89D4F
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p8so18211853wrx.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wldsqjpaFVDFoYgF4DYJ7wI1w74XU6uKcd1AqstflIg=;
 b=j2lpQSm4QAruRHwdMh9MeGZIC4kPQ82NerLc4fhX1Bf7ALSDHI5+t4h/QNS+ETUlkP
 Oc0ibH/V0O5O1c3FC3j5OXzmPUqRr9hDN829yi5pqtPFDwVbfrnW3SnegJl6K/xqflq/
 7cv3kQf3peWq0HBjW8kRrH1PMz7wRm+kNtLf1Q5A8IDR3OuihiLFyjl2GN7VJraUbohg
 c7Kn0VF2HguehowbndbNIUhMlyJv1A9XAVuBA3ozsUiqXFLfq6qlZr2eFDpFmChxIatw
 WlIJQhIOb2zFNvbP+nwZOsSV6Km0QodzzixeR1P/WvdhBx1dFeoaIIN6HIgM2+vD+p8k
 H+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wldsqjpaFVDFoYgF4DYJ7wI1w74XU6uKcd1AqstflIg=;
 b=k2IYnCZ5FfW4UucPLc5a8Knag4nPVPFjV6qGij8GucMUGBEEn0XRTua1zC6xma5Vtl
 qVllHzcNnx5Aq6SNNlRslm00j1d82zHtDHl/DZ8w/YBFwvDIVRaOnqfY2z+Vn5A6awVl
 DKGtLg0MvoAuFMd0BcdAs78e5tS+zzfbf0PS20QO4DAGuksXYnZgE9Ube5Ft+Hsl5OCf
 u0zKB7ViLvG3Ns8kW3tj8CKrHpi1foE6kvt5zsvJ3MwUWCbdqyaCdqC/BAWDJj+a/A9A
 zElzKQ9Q05KYhkVtSDkpJmH64WirLdXz2f2CqEgBS0BN1RV9Ol2APhr5QyVyJEo/nbmA
 SjXQ==
X-Gm-Message-State: AOAM532loQTFsiEE+rxn9VFArh1z1JlSFSbXRzqi7IpzrhyBWRU/po3F
 a+ylReWt7Hf1FL33G+U2TWHucw==
X-Google-Smtp-Source: ABdhPJzkQHLFLDVqk8bBYOGQlRNcxZJ2NJUnUeOlCzkzous3GkJECyu4+omxNzV9wQBqsYx2tYgfkA==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr9164383wru.260.1606130389281; 
 Mon, 23 Nov 2020 03:19:49 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/40] drm/amd/amdgpu/uvd_v3_1: Fix-up some documentation
 issues
Date: Mon, 23 Nov 2020 11:19:00 +0000
Message-Id: <20201123111919.233376-22-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3YzXzEuYzo5MTogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnam9iJyBub3QgZGVzY3JpYmVkIGluICd1dmRfdjNfMV9yaW5nX2Vt
aXRfaWInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjNfMS5jOjkxOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJlZCBpbiAn
dXZkX3YzXzFfcmluZ19lbWl0X2liJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Yz
XzEuYzoxMDg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FkZHInIG5v
dCBkZXNjcmliZWQgaW4gJ3V2ZF92M18xX3JpbmdfZW1pdF9mZW5jZScKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3V2ZF92M18xLmM6MTA4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdzZXEnIG5vdCBkZXNjcmliZWQgaW4gJ3V2ZF92M18xX3JpbmdfZW1pdF9mZW5j
ZScKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92M18xLmM6MTA4OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJlZCBpbiAndXZk
X3YzXzFfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Yz
XzEuYzoxMDg6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2ZlbmNlJyBkZXNj
cmlwdGlvbiBpbiAndXZkX3YzXzFfcmluZ19lbWl0X2ZlbmNlJwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdXZkX3YzXzEuYzo2MjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2hhbmRsZScgbm90IGRlc2NyaWJlZCBpbiAndXZkX3YzXzFfaHdfaW5pdCcKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92M18xLmM6NjI1OiB3YXJuaW5nOiBFeGNlc3MgZnVu
Y3Rpb24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlvbiBpbiAndXZkX3YzXzFfaHdfaW5pdCcK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92M18xLmM6NjkyOiB3YXJuaW5nOiBGdW5j
dGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdoYW5kbGUnIG5vdCBkZXNjcmliZWQgaW4gJ3V2ZF92
M18xX2h3X2ZpbmknCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjNfMS5jOjY5Mjog
d2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVzY3JpcHRpb24gaW4g
J3V2ZF92M18xX2h3X2ZpbmknCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBTb25ueSBKaWFuZyA8c29ubnkuamlhbmdAYW1kLmNvbT4KQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3YzXzEuYyB8IDEwICsrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3YzXzEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92M18xLmMKaW5kZXggN2NmNGIxMWE2NWM1Yy4uMTQzYmE3
YTQxZjQxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3YzXzEu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjNfMS5jCkBAIC04MCw3ICs4
MCw5IEBAIHN0YXRpYyB2b2lkIHV2ZF92M18xX3Jpbmdfc2V0X3dwdHIoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKQogICogdXZkX3YzXzFfcmluZ19lbWl0X2liIC0gZXhlY3V0ZSBpbmRpcmVjdCBi
dWZmZXIKICAqCiAgKiBAcmluZzogYW1kZ3B1X3JpbmcgcG9pbnRlcgorICogQGpvYjogdW51c2Vk
CiAgKiBAaWI6IGluZGlyZWN0IGJ1ZmZlciB0byBleGVjdXRlCisgKiBAZmxhZ3M6IHVudXNlZAog
ICoKICAqIFdyaXRlIHJpbmcgY29tbWFuZHMgdG8gZXhlY3V0ZSB0aGUgaW5kaXJlY3QgYnVmZmVy
CiAgKi8KQEAgLTk5LDcgKzEwMSw5IEBAIHN0YXRpYyB2b2lkIHV2ZF92M18xX3JpbmdfZW1pdF9p
YihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCiAgKiB1dmRfdjNfMV9yaW5nX2VtaXRfZmVuY2Ug
LSBlbWl0IGFuIGZlbmNlICYgdHJhcCBjb21tYW5kCiAgKgogICogQHJpbmc6IGFtZGdwdV9yaW5n
IHBvaW50ZXIKLSAqIEBmZW5jZTogZmVuY2UgdG8gZW1pdAorICogQGFkZHI6IGFkZHJlc3MKKyAq
IEBzZXE6IHNlcXVlbmNlIG51bWJlcgorICogQGZsYWdzOiBmZW5jZSByZWxhdGVkIGZsYWdzCiAg
KgogICogV3JpdGUgYSBmZW5jZSBhbmQgYSB0cmFwIGNvbW1hbmQgdG8gdGhlIHJpbmcuCiAgKi8K
QEAgLTYxNyw3ICs2MjEsNyBAQCBzdGF0aWMgdm9pZCB1dmRfdjNfMV9lbmFibGVfbWdjZyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIC8qKgogICogdXZkX3YzXzFfaHdfaW5pdCAtIHN0YXJ0
IGFuZCB0ZXN0IFVWRCBibG9jawogICoKLSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIK
KyAqIEBoYW5kbGU6IGhhbmRsZSB1c2VkIHRvIHBhc3MgYW1kZ3B1X2RldmljZSBwb2ludGVyCiAg
KgogICogSW5pdGlhbGl6ZSB0aGUgaGFyZHdhcmUsIGJvb3QgdXAgdGhlIFZDUFUgYW5kIGRvIHNv
bWUgdGVzdGluZwogICovCkBAIC02ODQsNyArNjg4LDcgQEAgc3RhdGljIGludCB1dmRfdjNfMV9o
d19pbml0KHZvaWQgKmhhbmRsZSkKIC8qKgogICogdXZkX3YzXzFfaHdfZmluaSAtIHN0b3AgdGhl
IGhhcmR3YXJlIGJsb2NrCiAgKgotICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICog
QGhhbmRsZTogaGFuZGxlIHVzZWQgdG8gcGFzcyBhbWRncHVfZGV2aWNlIHBvaW50ZXIKICAqCiAg
KiBTdG9wIHRoZSBVVkQgYmxvY2ssIG1hcmsgcmluZyBhcyBub3QgcmVhZHkgYW55IG1vcmUKICAq
LwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
