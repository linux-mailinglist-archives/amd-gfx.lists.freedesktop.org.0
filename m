Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D2ECBF32
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 17:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46786EBA4;
	Fri,  4 Oct 2019 15:30:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BE26EBA4
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 15:30:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z9so7704439wrl.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 08:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpYdykmFh1L9wlnaKUXKHI9WeLHFT+tvrgmV4Na3wpE=;
 b=XCv73sFLO9aRSn9IxlXqhM1Cr1hz5IYDknfQ96LQ3LXsTsKrCmHmPAz2FbztSAjSUF
 QSzK8seY6Bi21iSZcYIJ0V6elVWo+SCs/fMu3A/mRslyYP3kbIxpzhSoceTyGz+j/651
 YRc74L4wUhS8Ujh0s3m+m1Zg62oe2qaxHb4F1r6Onxd3amc1rypfFuw4FXlmcChbDw3a
 P7AgWrSxjku86YvK+wrJMMvloNUiqvwfNJjwYBLePWLyvO8XfdYNIUaa9CBH1NxC//TV
 GBF4lLS7X0B/LJSMvwy9ipK3rZ9UDrn43YnWPm63W0Pa1frSfqR/uH9XQhYl4h+U3a8V
 wfmQ==
X-Gm-Message-State: APjAAAUXfrqVKmamLBPOfA0d4rt4Lg3igmuYKTjetq1pTtwbizl41XUm
 sI9OOrMS7MAEt3nLT/FJrYHYRZMpc9LZQMRvYwu7yA==
X-Google-Smtp-Source: APXvYqz3KmAi8uo1x+D3aF+ZiUaCfvaBUC3pn6PrtkKBCPCDkqUyvRX6pw/rl8cyQJqagqASNi2YsopW0DAAYo/DmT0=
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr7457017wrr.11.1570203054978; 
 Fri, 04 Oct 2019 08:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 11:30:42 -0400
Message-ID: <CADnq5_Oas+s-TTUrDLHxjm5jNaTTiBtXutt5e7ibEACEhrEoRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdkfd: Fix MQD size calculation
To: "Zeng, Oak" <Oak.Zeng@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WpYdykmFh1L9wlnaKUXKHI9WeLHFT+tvrgmV4Na3wpE=;
 b=nv7b2sdFue9yZqO0XaYwugdxBMQY8Cvpg66JxnLMvOrygQ0P3y6YJuKZ49Bcv/t7Se
 R0MwGMynhSOung4It0UNoWBCt+zIKu3fJBj3oWl9mmrnrWTM10QpP2UKryFwGLyiS2xt
 ub4AnZoN5yUv7lxvZZUSv/C21osCxSeSbekrvq4/T7giCeCPh0BieekoonBxgrmoxatj
 uTJUeEisAskNHyQ5HDmU8R9dUS8Dh6+EJE5fd8EI/GbRPH79YlaEXdHqGIfwwV+PFn25
 7S5hUjyPtjqrjZEVb32A6fLvOsTUuWW68EkbGLDcDvEJPJB59fF8PhriP3ykuN36Xw9U
 mYVw==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAxMDo0OCBBTSBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5j
b20+IHdyb3RlOgo+Cj4gT24gZGV2aWNlIGluaXRpYWxpemF0aW9uLCBhIHRydW5rIG9mIEdUVCBt
ZW1vcnkgaXMgcHJlLWFsbG9jYXRlZCBmb3IKCnR5cG86IHRydW5rIC0+IGNodW5rCgpBbGV4Cgo+
IEhJUSBhbmQgYWxsIFNETUEgcXVldWVzIG1xZC4gVGhlIHNpemUgb2YgdGhpcyBhbGxvY2F0aW9u
IHdhcyB3cm9uZy4KPiBUaGUgY29ycmVjdCBzZG1hIGVuZ2luZSBudW1iZXIgc2hvdWxkIGJlIFBD
SWUtb3B0aW1pemVkIFNETUEgZW5naW5lCj4gbnVtYmVyIHBsdXMgeGdtaSBTRE1BIGVuZ2luZSBu
dW1iZXIuCj4KPiBDaGFuZ2UtSWQ6IEllY2QxMWFlNGY1YTMxNDU5MTU2Njc3MmFhMmEyM2UxZmU0
Yjk0Mjc1Cj4gUmVwb3J0ZWQtYnk6IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYwo+IGluZGV4IDE2YzA0ZjguLmU1NWQwMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYwo+IEBAIC0xODQ5
LDcgKzE4NDksOCBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX2hpcV9zZG1hX21xZChzdHJ1Y3QgZGV2
aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkKPiAgICAgICAgIHN0cnVjdCBrZmRfZGV2ICpkZXYgPSBk
cW0tPmRldjsKPiAgICAgICAgIHN0cnVjdCBrZmRfbWVtX29iaiAqbWVtX29iaiA9ICZkcW0tPmhp
cV9zZG1hX21xZDsKPiAgICAgICAgIHVpbnQzMl90IHNpemUgPSBkcW0tPm1xZF9tZ3JzW0tGRF9N
UURfVFlQRV9TRE1BXS0+bXFkX3NpemUgKgo+IC0gICAgICAgICAgICAgICBkZXYtPmRldmljZV9p
bmZvLT5udW1fc2RtYV9lbmdpbmVzICoKPiArICAgICAgICAgICAgICAgKGRldi0+ZGV2aWNlX2lu
Zm8tPm51bV9zZG1hX2VuZ2luZXMgKwo+ICsgICAgICAgICAgICAgICBkZXYtPmRldmljZV9pbmZv
LT5udW1feGdtaV9zZG1hX2VuZ2luZXMpKgo+ICAgICAgICAgICAgICAgICBkZXYtPmRldmljZV9p
bmZvLT5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSArCj4gICAgICAgICAgICAgICAgIGRxbS0+
bXFkX21ncnNbS0ZEX01RRF9UWVBFX0hJUV0tPm1xZF9zaXplOwo+Cj4gLS0KPiAyLjcuNAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
