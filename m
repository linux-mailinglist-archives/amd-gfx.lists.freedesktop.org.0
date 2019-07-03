Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855765E178
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 11:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187E16E10F;
	Wed,  3 Jul 2019 09:55:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDFB6E110
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 09:54:58 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so1452691edv.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 02:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Uk3Ch3YDbbsqM+pKnGRUL9+3WRRG3D2+E1fyTpSzOR0=;
 b=AcJQt1ZJGqO1TIRoFBfqzDchKswUqNh1R58+bQz14LvxKby8j58vmNr242xK+jDTKl
 wei8VNubFIoSx5BbCkTwLc52YMb9xN9TrDp/Z1lB4Tsz/n/Yt1ATvFw1x/8pga/uAMo7
 YGnNVvjAm4XuW+C1JxJvSF3qqJyAdFK0RMKkgHWAy/bVc/7Femd/j1j49unyWqcTeH2f
 UUlc5qKFxAben/n3D/YdOcD4j9/QS+ADlDjCu3WmqU4jOCsyy9LWSKgP9YaWnblbxvRx
 QyQXfLdGp09B1LcDPbY3mQiGZWDbYSb7TQRoZ5p85aWDMSOYLTjQx3Hq8IqyzzpgsAbe
 ogHQ==
X-Gm-Message-State: APjAAAXJ7VqUmXvqoOX8OapY3sAhvParAaIrMzAMNm9//qJBH0jru0R+
 0Yg48leTqAgQ+LWbdKCc9sCdNA==
X-Google-Smtp-Source: APXvYqxKTZ3mcipeAwzIvV1eoDXZzinZ8Pl/unoIm4iDh9cFbrYPdL1D5e/s3w8CvMEQ7Nt93QEiAw==
X-Received: by 2002:a50:d1c6:: with SMTP id i6mr40763749edg.110.1562147697354; 
 Wed, 03 Jul 2019 02:54:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w14sm533145eda.69.2019.07.03.02.54.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 02:54:56 -0700 (PDT)
Date: Wed, 3 Jul 2019 11:54:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
Message-ID: <20190703095453.GE15868@phenom.ffwll.local>
References: <20190703015705.3162-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703015705.3162-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Uk3Ch3YDbbsqM+pKnGRUL9+3WRRG3D2+E1fyTpSzOR0=;
 b=ZNZ0cWlsipBtqO7aUEOI9vuCkOhaQIv+sa8xvzTfS3SJamkbit8srC7yWFNB6mF+tr
 5ZkmtZAqlr937xK+1rysRlR2spyp/j7kURLdAOTU0ESmhO8V0N2by+To9AqgoX29wD54
 wsH5SRuft2K0xNA3dmmz1kTlfNfCxCscY2/Ss=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDg6NTc6MDVQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IEhpIERhdmUsIERhbmllbCwKPiAKPiAzIGZpeGVzIGFsbCBjYydlZCB0byBzdGFibGUu
ICBOb3RlIHRoYXQgZGltIGNvbXBsYWlucyBhYm91dCB0aGUgRml4ZXMgdGFnCj4gaW4gb25lIG9m
IHRoZSBwYXRjaGVzLiAgVGhlIHBhdGNoIGhhczoKPiBGaXhlczogOTIxOTM1ZGM2NDA0ICgiZHJt
L2FtZC9wb3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24g
bmVlZGVkIikKPiB3aGlsZSBkaW0gcmVjb21tZW5kczoKClRoaXMgaXMgdGhlIHJpZ2h0IGZvcm1h
dC4KCj4gRml4ZXM6IGNvbW1pdCA5MjE5MzVkYzY0MDQgKCJkcm0vYW1kL3Bvd2VycGxheTogZW5m
b3JjZSBkaXNwbGF5IHJlbGF0ZWQgc2V0dGluZ3Mgb25seSBvbiBuZWVkZWQiKQoKQWRkaW5nIGEg
ImNvbW1pdCIgaXMgd3JvbmcuIEFuZCBhdCBsZWFzdCBteSBkaW0gaGVyZSBkb2Vzbid0IGNvbXBs
YWluCmFib3V0IHlvdXIgcHVsbC4gSG93IGRpZCB5b3UgdGVzdCB0aGlzPwotRGFuaWVsCgo+IEkg
ZmVlbCBsaWtlIHRoZSBmb3JtZXIgaXMgdGhlIG1vcmUgY29tbW9uIG5vbWVuY2xldHVyZSAoYXQg
bGVhc3QgaGlzdG9yaWNhbGx5KSwKPiBidXQgSSdtIGhhcHB5IHRvIHJlc3BpbiBpZiB5b3UnZCBw
cmVmZXIuCj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2NjVkNmQ0ZTMy
MzEzYTc5NTJiYjMzMzk2NDdmNzRjM2E2YjBkNzhhOgo+IAo+ICAgTWVyZ2UgdGFnICdkcm0tbWlz
Yy1maXhlcy0yMDE5LTA2LTI2JyBvZiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MgaW50byBkcm0tZml4ZXMgKDIwMTktMDYtMjcgMTE6MzQ6NTIgKzEwMDApCj4gCj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCB0YWdzL2RybS1maXhlcy01LjItMjAxOS0w
Ny0wMgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyNWYwOWY4NTg4MzViMGU5
YTA2MjEzODExMDMxMTkwYTE3ZDhhYjc4Ogo+IAo+ICAgZHJtL2FtZGdwdS9nZng5OiB1c2UgcmVz
ZXQgZGVmYXVsdCBmb3IgUEFfU0NfRklGT19TSVpFICgyMDE5LTA3LTAxIDEyOjE2OjI2IC0wNTAw
KQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBkcm0tZml4ZXMtNS4yLTIwMTktMDctMDI6Cj4gCj4gRml4ZXMgZm9y
IHN0YWJsZQo+IAo+IGFtZGdwdToKPiAtIHN0YWJpbGl0eSBmaXggZm9yIGdmeDkKPiAtIHJlZ3Jl
c3Npb24gZml4IGZvciBIRyBvbiBzb21lIHBvbGFyaXMgYm9hcmRzCj4gLSBjcmFzaCBmaXggZm9y
IHNvbWUgbmV3IE9FTSBib2FyZHMKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQWxleCBEZXVjaGVyICgxKToKPiAg
ICAgICBkcm0vYW1kZ3B1L2dmeDk6IHVzZSByZXNldCBkZWZhdWx0IGZvciBQQV9TQ19GSUZPX1NJ
WkUKPiAKPiBFdmFuIFF1YW4gKDEpOgo+ICAgICAgIGRybS9hbWQvcG93ZXJwbGF5OiB1c2UgaGFy
ZHdhcmUgZmFuIGNvbnRyb2wgaWYgbm8gcG93ZXJwbGF5IGZhbiB0YWJsZQo+IAo+IEx5dWRlIFBh
dWwgKDEpOgo+ICAgICAgIGRybS9hbWRncHU6IERvbid0IHNraXAgZGlzcGxheSBzZXR0aW5ncyBp
biBod21ncl9yZXN1bWUoKQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jICAgICAgICAgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyAgICAgICAgICAgfCAgMiArLQo+ICAu
Li4vZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvcHJvY2Vzc19wcHRhYmxlc192MV8wLmMgICB8ICA0
ICsrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmggICAgICAg
ICAgICAgfCAgMSArCj4gIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3BvbGFyaXMx
MF9zbXVtZ3IuYyAgIHwgIDQgKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
