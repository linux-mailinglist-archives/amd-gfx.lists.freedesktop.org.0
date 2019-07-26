Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931E75F86
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5016E895;
	Fri, 26 Jul 2019 07:14:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E26A6E895
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 07:14:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 207so47050116wma.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 00:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+csnFR8mkxO4Oz41CiXl/dAB+TgEoan7BBwy0z2+GcE=;
 b=AntlLkzyfCrvYPKsUL1N8BBrs/UfMEHBdHvP4qiRkzgm4iX2dHdiK5lZ687CF07mn9
 XtueIJQspv59xrTQSf7FlmdRskjm/xWD6bNUM4dIoCMqOYyHcEe1yb/2v6H0GLas7fo/
 TsKWq0bkQT6PdKmazfKXLpEvbdknhotrh07CVNQt8QCirRj4PyjAg+um11SYbN2SAGsZ
 GceGIE2MAdNKCJlzi9UqKwdMdLumO7j+2UVaicAB+ma2JJI++Fe/IoW3E3+Zs01MnW5v
 i9LaJYDG2hIEGoLURHAg12y0Bzap7FcEqWgtmR+gwXESMBFP/5tcW6IIG9K8d/V0O2Rj
 Q5ew==
X-Gm-Message-State: APjAAAXS2tcoAfdNxHn0BG1VBXtYBMz9Oiv430AOF7lP03UtzR15gQnU
 sXrY8aENyPAk4kbXERuPV/k=
X-Google-Smtp-Source: APXvYqwwpWZmaN49IgtjFxtwx26Tg7QF0wbguioAph+KZGgVRQlxjARUv2yd+DxdDWHMbl21AG7q0g==
X-Received: by 2002:a1c:6686:: with SMTP id
 a128mr83064694wmc.149.1564125296710; 
 Fri, 26 Jul 2019 00:14:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r12sm61029975wrt.95.2019.07.26.00.14.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 00:14:56 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a1e2755c-142c-ceaf-9be4-1ffff4d25cea@gmail.com>
Date: Fri, 26 Jul 2019 09:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+csnFR8mkxO4Oz41CiXl/dAB+TgEoan7BBwy0z2+GcE=;
 b=K+PIyVJirDVi88eVhhsdVxwZGV2BrulrxxBTPN8FfA6iZy4uxjMsvaGxkyaZr9AeNc
 NMh/HOwa0CePIitc/PYpYtULO3rD4LzGI+UIvV0aITWuTE7AZ0Z9mgQpOvdB2MlAIjaK
 lSwYpf+XQgi2VCI4IqlUxr6DFQmYXCtZ6JKBk3h/23ptI6fF1XAz+/1P4CuscdL7+iVj
 OS8+iFOq8BLCqjkTiUqga/MG94RfAzwd1L4Yz/Uqtut9Z2rsDZphRSCLs4gQzqD7Qk6t
 GB4aNC1q8jXCcGOPs1PKLd9xKLVgU7k7xRMRaNjAIH9TWVLD7C9l/5wuKnPOQuhu2ytm
 8zmA==
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, michel@daenzer.net, hersenxs.wu@amd.com,
 Christian.Koenig@amd.com, shirish.s@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjUuMDcuMTkgdW0gMTY6MjQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBGcm9tOiBT
aGlyaXNoIFMgPHNoaXJpc2guc0BhbWQuY29tPgo+Cj4gZW5hYmxlcyBncHVfdm1fc3VwcG9ydCBp
biBkbSBhbmQgYWRkcwo+IEFNREdQVV9HRU1fRE9NQUlOX0dUVCBhcyBzdXBwb3J0ZWQgZG9tYWlu
Cj4KPiB2MjoKPiBNb3ZlIEJPIHBsYWNlbWVudCBsb2dpYyBpbnRvIGFtZGdwdV9kaXNwbGF5X3N1
cHBvcnRlZF9kb21haW5zCj4KPiB2MzoKPiBVc2UgYW1kZ3B1X2JvX3ZhbGlkYXRlX3Vzd2MgaW4g
YW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMuCj4KPiB2NDoKPiBhbWRncHVfYm9fdmFs
aWRhdGVfdXN3YyBtb3ZlZCB0byBzZXBwZXJhdGUgcGF0Y2guCj4KPiBDaGFuZ2UtSWQ6IElmMzQz
MDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIwCj4gU2lnbmVkLW9mZi1ieTogU2hp
cmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgICAgICAgfCAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKPiBpbmRleCBjYWM5OTc1Li43MzA0
NWEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNw
bGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
Cj4gQEAgLTUwNSw3ICs1MDUsNyBAQCB1aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkgKiBBUFVzLiBTbyBmb3Jj
ZSB0aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQo+ICAg
CSAqIHdpbGwgbm90IGFsbG93IFVTV0MgbWFwcGluZ3MuCj4gICAJICovCj4gLQlpZiAoYWRldi0+
YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVO
ICYmCj4gKwlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfQ0FSUklaTyAmJiBhZGV2LT5hc2lj
X3R5cGUgPD0gQ0hJUF9SQVZFTiAmJgoKVGhpcyB3aG9sZSBhcHByb2FjaCBpcyBpbmNvcnJlY3Qg
c2luY2Ugd2UgZG9uJ3QgY2hlY2sgdGhlIGZsYWdzIG9mIHRoZSAKYWN0dWFsbHkgQk8gdXNlZCBm
b3Igc2Nhbm91dCBhbnkgbW9yZS4KCkFzIEkgd3JvdGUgYmVmb3JlIGl0IGlzIHN0aWxsIHBlcmZl
Y3RseSBwb3NzaWJsZSBhbmQgdmFsaWQgdGhhdCAKdXNlcnNwYWNlIG5ldmVyIHNldHMgdGhpcyBm
bGFnLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAgIAkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNf
QVBVICYmIGFtZGdwdV9ib19zdXBwb3J0X3Vzd2MoMCkgJiYKPiAgIAkgICAgYW1kZ3B1X2Rldmlj
ZV9hc2ljX2hhc19kY19zdXBwb3J0KGFkZXYtPmFzaWNfdHlwZSkpCj4gICAJCWRvbWFpbiB8PSBB
TURHUFVfR0VNX0RPTUFJTl9HVFQ7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggNDkyMjU4OS4uZjAzODdjZTEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPiBAQCAtNjg2LDcgKzY4Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJICovCj4gICAJaWYgKGFkZXYtPmZsYWdzICYgQU1E
X0lTX0FQVSAmJgo+ICAgCSAgICBhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9DQVJSSVpPICYmCj4g
LQkgICAgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTikKPiArCSAgICBhZGV2LT5hc2ljX3R5
cGUgPD0gQ0hJUF9SQVZFTikKPiAgIAkJaW5pdF9kYXRhLmZsYWdzLmdwdV92bV9zdXBwb3J0ID0g
dHJ1ZTsKPiAgIAo+ICAgCWlmIChhbWRncHVfZGNfZmVhdHVyZV9tYXNrICYgRENfRkJDX01BU0sp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
