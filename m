Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC512C354B
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939D6E794;
	Tue,  1 Oct 2019 13:16:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5646E794
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 13:16:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so15496968wrj.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Oct 2019 06:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yo987pgWynyW+ras7XF50DDlSNVf8UbbV7CA/qQO1Lc=;
 b=FzLHtYTW0Dg2Wh6Bt22uyrkZ5AEoYFHnUM4LuqwZ63QoshowwYNw5EE+Srre2H3MhN
 v3FDdMGj6F1yPJi1AgsQvIJorHmgJ46jPjuZJ0mm83+M9nFDab1btgkGpZjvZOEIgAsf
 +TICtkDsRC4lyo/zLyDVrjYYXpDIU0bQNNgSQQzHCJ9cC7ahLJRRBLZfn/x5ecc3ufVt
 /38oSD3k55n7oUMcLTP/1wg/+YHqu9Vd+C9skrxdiGJHvYIJGxSbNJRQgoA8ziuxipFq
 Tt5+sLurQJe74N53+vTny+AWQM3H9y+klb4WbJZfrEbYVwwCXwJroegBXq/wUapz/1Cv
 9gIw==
X-Gm-Message-State: APjAAAU4/zYH/T3j/rGh30zYSHQ8SqDF+rqEwnH+lduGNNaRQm4frha6
 TR45TvHVmeFlGj+sOH1jdtFO8pLIz/K8g4Z6eQgSkDO7
X-Google-Smtp-Source: APXvYqzpH/wt61D7AL70yZCVaBMfeJpbrjxdgh/q5bhHp6CyHHzEjemrAW+yZVMJ59TpA5PoFDItMaqV41GFCuotn94=
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr17560040wrn.40.1569935760251; 
 Tue, 01 Oct 2019 06:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <1569737976-23985-1-git-send-email-curry.gong@amd.com>
In-Reply-To: <1569737976-23985-1-git-send-email-curry.gong@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Oct 2019 09:15:48 -0400
Message-ID: <CADnq5_Pgz2_LicfnCG9wK=MZ_FiyaNok+9irWbPy8Gah-XiJpA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Do not implement power-on for SDMA after do
 mode2 reset on Renoir
To: chen gong <curry.gong@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yo987pgWynyW+ras7XF50DDlSNVf8UbbV7CA/qQO1Lc=;
 b=QG2itLpQl/Q68Pc2UkhBrFh+7df62fkDX62q/YHGTHWIWyFMTGnXF2ud+CLsWJdzGO
 fuYue8z+MRdbnaShvfVs/hXWN2LUckbJZo6RjwynMIXZLqC9YZmKfYhOWWL5UkeU/LxF
 rNZq62aJTVuMhPyEnHyK7s5Mf2PY54s47pGR5eHj8GraA/S7onI3dV0MpfkyuKM8WXBD
 zxs4R2xEEsWXDmdcHUwI37SN3jhODJIyzglbmGoU+PCRs9HsNLzEDiGp4Xi5Rrz7HegC
 Gt9jCBr4bzyfPG1hVwBQEVlPIKP3ymApFSJzuguEAj3dtuvMIoFk+IAScyHo9419hIpV
 arHA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgMjoxOSBBTSBjaGVuIGdvbmcgPGN1cnJ5LmdvbmdAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBGaW5kIHRoYXQgcmluZyBzZG1hMCB0ZXN0IGZhaWxlZCBpZiB0dXJu
IG9uIFNETUEgcG93ZXJnYXRpbmcgYWZ0ZXIgZG8KPiBtb2RlMiByZXNldC4KPgo+IFBlcmhhcHMg
dGhlIG1vZGUyIHJlc2V0IGRvZXMgbm90IHJlc2V0IHRoZSBTRE1BIFBHIHN0YXRlLCBTRE1BIGlz
Cj4gYWxyZWFkeSBwb3dlcmVkIHVwIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gYXNrIHRoZSBTTVUg
dG8gcG93ZXIgaXQgdXAKPiBhZ2Fpbi4gU28gSSBza2lwIHRoaXMgZnVuY3Rpb24gZm9yIGEgbW9t
ZW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCj4gaW5kZXggOTY1ODFiNS4uZTBlYjI0NTAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwo+IEBAIC0xNzkyLDcgKzE3
OTIsNyBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9od19pbml0KHZvaWQgKmhhbmRsZSkKPgo+ICAg
ICAgICAgaWYgKChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3MgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5wb3dlcnBsYXku
cHBfZnVuY3MtPnNldF9wb3dlcmdhdGluZ19ieV9zbXUpIHx8Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIgJiYgYWRldi0+aW5fZ3B1X3Jl
c2V0ICE9IDEpKQoKSG93IGFib3V0ICFhZGV2LT5pbl9ncHVfcmVzZXQgcmF0aGVyIHRoYW4gZXhw
bGljaXRseSBjaGVja2luZyBmb3IgMT8KV2l0aCB0aGF0IGZpeGVkOgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQWxleAoKPiAgICAgICAgICAg
ICAgICAgYW1kZ3B1X2RwbV9zZXRfcG93ZXJnYXRpbmdfYnlfc211KGFkZXYsIEFNRF9JUF9CTE9D
S19UWVBFX1NETUEsIGZhbHNlKTsKPgo+ICAgICAgICAgaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRl
dikpCj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
