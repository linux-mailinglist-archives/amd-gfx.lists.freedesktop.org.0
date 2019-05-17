Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915421E29
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 21:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B362589970;
	Fri, 17 May 2019 19:22:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD789970
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 19:22:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e15so8257788wrs.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 12:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6t8Audkvtbcx/6YEqy+6tljqiewjDEy8ZMlHoz/LFK4=;
 b=RLUV1krjdTe3BI0bsWzlud+ZJPt9sWm6x8MRkuFUHZu0Noq8mfPTvsduiL/fVEIDoi
 QlkuJh6k8Jgnb/ORwksAsp+c1Hjv6Xy5qJMxweYvYOAImKQUHeM3h1NCt1oBKmZkY5LO
 vWy3D+pE+YdxJRhOFvF9sOmwbriMTC0AaR2LNXlC4OKMSnN2V6jxXG89j7SZCofQ6Xp2
 L6kvPji52vWMiehnbIYUVnjS7xAURFs+b2IAHpBRmdYuX6XrTv6zD+cZ3Nz9kbJWAhBK
 upJR+wNuYhQvmppVBOjnhiuu7aTFJCSCHmp6uaNUiRnNqbpJseZ/NHDCK47pZZvrRnvz
 +yDA==
X-Gm-Message-State: APjAAAVV/j4a+SUHv4OGem1UEogFbSS+Yg2cJu0Xy3X/HGP7O5XgESzp
 LEbRvZwspNipa847jS3yXFvZkSGr4RYDO/0d/BsxLA==
X-Google-Smtp-Source: APXvYqz7mgRBzUapJdm80X6p9DlUSsxdSbZI65Y4nwdY0fDUHAcR4/UyXVGqnjKih7lw+8clzE9axOol75KyXH3Hag8=
X-Received: by 2002:a5d:430f:: with SMTP id h15mr18229931wrq.132.1558120946172; 
 Fri, 17 May 2019 12:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR12MB14176FD13FDBCDBB309D0301FE0B0@DM5PR12MB1417.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14176FD13FDBCDBB309D0301FE0B0@DM5PR12MB1417.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2019 15:22:14 -0400
Message-ID: <CADnq5_OecFM8G6LsUgLiowEMPhPaY9EvnncUwvSADuPMZowV2w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use div64_ul for 32-bit compatibility v1
To: "Abramov, Slava" <Slava.Abramov@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6t8Audkvtbcx/6YEqy+6tljqiewjDEy8ZMlHoz/LFK4=;
 b=GMOwy4XwexbUmPDuJgA8XQy3Kjvsg3DHWcqp3vv4y9/Kd0QZ679l2l/3y9JWepdrk9
 gTaSSi2JBQvidz0sqxaWCo+Lwqt3dJTRP/6+b+EezXUcXRGjxgMsIXY51r0v9t/yDs1/
 LpWX/rEGW15uj3NPyhI6AY6gslGNO+jSsgn6tlAREvx9l1zA93L+bIc/KOUtbBUlYwY5
 rR1H16crsaCmD8CtIdZgRzPD8T35jbF2vKxgi3tCSi23mgzh+NCWt1+VBjJSyv2seFvE
 0MD2Sg6GvF6N4O57IpcH4MLWH6Q+kiJVmJvXxkGkcQGCnn7Z7SP6vLwST2uW1x/gqdoZ
 ja9g==
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMjozNCBQTSBBYnJhbW92LCBTbGF2YSA8U2xhdmEuQWJy
YW1vdkBhbWQuY29tPiB3cm90ZToKPgo+IHYxOiByZXBsYWNlIGNhc3RpbmcgdG8gdW5zaWduZWQg
bG9uZyB3aXRoIGRpdjY0X3VsCj4KPiBDaGFuZ2UtSWQ6IElhNDg2NzFlZDA3NTZiYjczYzdiNDc2
MGE4MDBiY2I2ZjYwMGNiZWYyCj4gU2lnbmVkLW9mZi1ieTogU2xhdmEgQWJyYW1vdiA8c2xhdmEu
YWJyYW1vdkBhbWQuY29tPgoKQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IGluZGV4
IGRhMWRjNDBiOWIxNC4uZDU3MTliMGZiODJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwo+IEBAIC03NjQsOCArNzY0LDggQEAgc3RhdGljIHNzaXplX3QgYW1k
Z3B1X3Jhc19zeXNmc19iYWRwYWdlc19yZWFkKHN0cnVjdCBmaWxlICpmLAo+ICAgc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBjb24tPmFkZXY7Cj4gICBjb25zdCB1bnNpZ25lZCBpbnQgZWxl
bWVudF9zaXplID0KPiAgIHNpemVvZigiMHhhYmNkYWJjZCA6IDB4MTIzNDU2NzggOiBSXG4iKSAt
IDE7Cj4gLSB1bnNpZ25lZCBpbnQgc3RhcnQgPSAocHBvcyArIGVsZW1lbnRfc2l6ZSAtIDEpIC8g
ZWxlbWVudF9zaXplOwo+IC0gdW5zaWduZWQgaW50IGVuZCA9IChwcG9zICsgY291bnQgLSAxKSAv
IGVsZW1lbnRfc2l6ZTsKPiArIHVuc2lnbmVkIGludCBzdGFydCA9IGRpdjY0X3VsKHBwb3MgKyBl
bGVtZW50X3NpemUgLSAxLCBlbGVtZW50X3NpemUpOwo+ICsgdW5zaWduZWQgaW50IGVuZCA9IGRp
djY0X3VsKHBwb3MgKyBjb3VudCAtIDEsIGVsZW1lbnRfc2l6ZSk7Cj4gICBzc2l6ZV90IHMgPSAw
Owo+ICAgc3RydWN0IHJhc19iYWRwYWdlICpicHMgPSBOVUxMOwo+ICAgdW5zaWduZWQgaW50IGJw
c19jb3VudCA9IDA7Cj4gLS0KPiAyLjE3LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
