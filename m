Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD449CC86
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 11:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568636E21F;
	Mon, 26 Aug 2019 09:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F326E21F
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 09:24:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w5so25520344edl.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 02:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=ZO8AbteKlDnbenLwdttIwUk2jVineZ9dTMFIq4Rq8ik=;
 b=uCPeb1BvL4w4KXfxunbiqiKEQm3BixPR2uFzOnePP/WvuOFF1Z4Vg9jyMe1PC3VBTc
 qK6rQJhS2qgobIQadMcAKi0vWl709MDz9GsQQATZNlOtCEAVpqLpB+HezC045Fo1sZet
 b2daIFUAXAqPSdIQPyFSiHPgVM7mcXNWz4nkHstzakp9f8XKqGvLcfirtqbUiAkNty9I
 um6PXPKbg3nrb9UWFu9wZTLE05YOk9bpPRnqe/RXnmtS++FfmwLi7aw+xLOhCdiDLrJY
 4NKz81gwyktGc1AmhyhBantwUHz+CuOn3yJdmSOP/PMx5hdCOqs0CC4LrtjcbBAU6Rvr
 bMvw==
X-Gm-Message-State: APjAAAX6J7H46jmxMWOso45BaW69pvBa1cebI/487zuiZCKNDrZxAFBY
 8GuIpLSioJKBfAj1/XCN6/ZO9A==
X-Google-Smtp-Source: APXvYqzmWME8EYs7U4nS+IyGiFsRi8nOF8GJj5iEowz/URYb4zmpZ/uNNWXyJXg9ybAhr4N92XGf4w==
X-Received: by 2002:a50:d65e:: with SMTP id c30mr17485393edj.38.1566811497549; 
 Mon, 26 Aug 2019 02:24:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b18sm2895375eju.0.2019.08.26.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 02:24:56 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:24:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
Message-ID: <20190826092408.GA2112@phenom.ffwll.local>
Mail-Followup-To: Hillf Danton <hdanton@sina.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <20190825141305.13984-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825141305.13984-1-hdanton@sina.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZO8AbteKlDnbenLwdttIwUk2jVineZ9dTMFIq4Rq8ik=;
 b=fIiwM2dgadA1cMLcHt67f4Qo9bl8GB68NNkqqV74vxArzrrCbrpUyW7XH/EwZCdR+k
 QNYBIUXQ3Iz2wn2zLULk02tnL4BX7BpfNK7hUMQRncmWrdlqSG/8b++qSw5KyCPsX9lG
 pR7kBVMFJ5435PPwx/D6LcSyh1GVG9bV/ohk0=
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
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMTA6MTM6MDVQTSArMDgwMCwgSGlsbGYgRGFudG9uIHdy
b3RlOgo+IAo+IE9uIFN1biwgMjUgQXVnIDIwMTkgMDQ6Mjg6MDEgLTA3MDAgTWlraGFpbCBHYXZy
aWxvdiB3cm90ZToKPiA+IEhpIGZvbGtzLAo+ID4gSSBsZWZ0IHVuYmxvY2tlZCBnbm9tZS1zaGVs
bCBhdCBub29uLCBhbmQgd2hlbiBJIHJldHVybmVkIGF0IHRoZQo+ID4gZXZlbmluZyBJIGRpc2Nv
dmVyZWQgdGhhbiBtb25pdG9yIG5vdCBzbGVlcGluZyBhbmQgc2hvdyBvcGVuIGdub21lCj4gPiBh
Y3Rpdml0eS4gQXQgZmlyc3QsIEkgdGhvdWdodCB0aGF0IHNvbWUgYXBwbGljYXRpb24gZGlkIG5v
dCBsZXQgZmFsbAo+ID4gYXNsZWVwIHRoZSBzeXN0ZW0uIEJ1dCB3aGVuIEkgdHJ5IHRvIG1vdmUg
dGhlIG1vdXNlLCBJIHJlYWxpemVkIHRoYXQKPiA+IHRoZSBzeXN0ZW0gaGFuZ2VkLiBTbyBJIGNv
bm5lY3QgdmlhIHNzaCBhbmQgdHJpZWQgdG8gaW52ZXN0aWdhdGUgdGhlCj4gPiBwcm9ibGVtLiBJ
IGRpZCBub3Qgc2VlIGFueXRoaW5nIHN0cmFuZ2UgaW4ga2VybmVsIGxvZ3MuIEFuZCBteSBsYXN0
Cj4gPiBpZGVhIGJlZm9yZSB0cnlpbmcgdG8ga2lsbCB0aGUgZ25vbWUtc2hlbGwgcHJvY2VzcyB3
YXMgZHVtcHMgdGFza3MKPiA+IHRoYXQgYXJlIGluIHVuaW50ZXJydXB0YWJsZSAoYmxvY2tlZCkg
c3RhdGUuCj4gPiAKPiA+IEFmdGVyIFtBbHQgKyBQcm5TY3IgKyBXXSBJIHNhdyB0aGlzOgo+ID4g
Cj4gPiBbMzI4NDAuNzAxOTA5XSBzeXNycTogU2hvdyBCbG9ja2VkIFN0YXRlCj4gPiBbMzI4NDAu
NzAxOTc2XSAgIHRhc2sgICAgICAgICAgICAgICAgICAgICAgICBQQyBzdGFjayAgIHBpZCBmYXRo
ZXIKPiA+IFszMjg0MC43MDI0MDddIGdub21lLXNoZWxsICAgICBEMTEyNDAgIDE5MDAgICAxODMw
IDB4MDAwMDAwMDAKPiA+IFszMjg0MC43MDI0MzhdIENhbGwgVHJhY2U6Cj4gPiBbMzI4NDAuNzAy
NDQ2XSAgPyBfX3NjaGVkdWxlKzB4MzUyLzB4OTAwCj4gPiBbMzI4NDAuNzAyNDUzXSAgc2NoZWR1
bGUrMHgzYS8weGIwCj4gPiBbMzI4NDAuNzAyNDU3XSAgc2NoZWR1bGVfdGltZW91dCsweDI4OS8w
eDNjMAo+ID4gWzMyODQwLjcwMjQ2MV0gID8gZmluZF9oZWxkX2xvY2srMHgzMi8weDkwCj4gPiBb
MzI4NDAuNzAyNDY0XSAgPyBmaW5kX2hlbGRfbG9jaysweDMyLzB4OTAKPiA+IFszMjg0MC43MDI0
NjldICA/IG1hcmtfaGVsZF9sb2NrcysweDUwLzB4ODAKPiA+IFszMjg0MC43MDI0NzNdICA/IF9y
YXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsweDRiLzB4NjAKPiA+IFszMjg0MC43MDI0NzhdICBk
bWFfZmVuY2VfZGVmYXVsdF93YWl0KzB4MWY1LzB4MzQwCj4gPiBbMzI4NDAuNzAyNDgyXSAgPyBk
bWFfZmVuY2VfZnJlZSsweDIwLzB4MjAKPiA+IFszMjg0MC43MDI0ODddICBkbWFfZmVuY2Vfd2Fp
dF90aW1lb3V0KzB4MTgyLzB4MWUwCj4gPiBbMzI4NDAuNzAyNTMzXSAgYW1kZ3B1X2ZlbmNlX3dh
aXRfZW1wdHkrMHhlNy8weDIxMCBbYW1kZ3B1XQo+ID4gWzMyODQwLjcwMjU3N10gIGFtZGdwdV9w
bV9jb21wdXRlX2Nsb2NrcysweDcwLzB4NWYwIFthbWRncHVdCj4gPiBbMzI4NDAuNzAyNjQxXSAg
ZG1fcHBfYXBwbHlfZGlzcGxheV9yZXF1aXJlbWVudHMrMHgxOWUvMHgxYzAgW2FtZGdwdV0KPiA+
IFszMjg0MC43MDI3MDVdICBkY2UxMl91cGRhdGVfY2xvY2tzKzB4ZDgvMHgxMTAgW2FtZGdwdV0K
PiA+IFszMjg0MC43MDI3NjZdICBkY19jb21taXRfc3RhdGUrMHg0MTQvMHg1OTAgW2FtZGdwdV0K
PiA+IFszMjg0MC43MDI4MzRdICBhbWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsKzB4ZDFlLzB4
MWNmMCBbYW1kZ3B1XQo+ID4gWzMyODQwLjcwMjg0MF0gID8gcmVhY3F1aXJlX2hlbGRfbG9ja3Mr
MHhlZC8weDIxMAo+ID4gWzMyODQwLjcwMjg0OF0gID8gdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRp
b24rMHhhNS8weDE2MCBbdHRtXQo+ID4gWzMyODQwLjcwMjg1M10gID8gZmluZF9oZWxkX2xvY2sr
MHgzMi8weDkwCj4gPiBbMzI4NDAuNzAyODU1XSAgPyBmaW5kX2hlbGRfbG9jaysweDMyLzB4OTAK
PiA+IFszMjg0MC43MDI4NjBdICA/IF9fbG9ja19hY3F1aXJlKzB4MjQ3LzB4MTkxMAo+ID4gWzMy
ODQwLjcwMjg2N10gID8gZmluZF9oZWxkX2xvY2srMHgzMi8weDkwCj4gPiBbMzI4NDAuNzAyODcx
XSAgPyBtYXJrX2hlbGRfbG9ja3MrMHg1MC8weDgwCj4gPiBbMzI4NDAuNzAyODc0XSAgPyBfcmF3
X3NwaW5fdW5sb2NrX2lycSsweDI5LzB4NDAKPiA+IFszMjg0MC43MDI4NzddICA/IGxvY2tkZXBf
aGFyZGlycXNfb24rMHhmMC8weDE4MAo+ID4gWzMyODQwLjcwMjg4MV0gID8gX3Jhd19zcGluX3Vu
bG9ja19pcnErMHgyOS8weDQwCj4gPiBbMzI4NDAuNzAyODg0XSAgPyB3YWl0X2Zvcl9jb21wbGV0
aW9uX3RpbWVvdXQrMHg3NS8weDE5MAo+ID4gWzMyODQwLjcwMjg5NV0gID8gY29tbWl0X3RhaWwr
MHgzYy8weDcwIFtkcm1fa21zX2hlbHBlcl0KPiA+IFszMjg0MC43MDI5MDJdICBjb21taXRfdGFp
bCsweDNjLzB4NzAgW2RybV9rbXNfaGVscGVyXQo+ID4gWzMyODQwLjcwMjkwOV0gIGRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdCsweGUzLzB4MTUwIFtkcm1fa21zX2hlbHBlcl0KPiA+IFszMjg0MC43
MDI5MjJdICBkcm1fYXRvbWljX2Nvbm5lY3Rvcl9jb21taXRfZHBtcysweGQ3LzB4MTAwIFtkcm1d
Cj4gPiBbMzI4NDAuNzAyOTM2XSAgc2V0X3Byb3BlcnR5X2F0b21pYysweGNjLzB4MTQwIFtkcm1d
Cj4gPiBbMzI4NDAuNzAyOTU1XSAgZHJtX21vZGVfb2JqX3NldF9wcm9wZXJ0eV9pb2N0bCsweGNi
LzB4MWMwIFtkcm1dCj4gPiBbMzI4NDAuNzAyOTY4XSAgPyBkcm1fbW9kZV9vYmpfZmluZF9wcm9w
X2lkKzB4NDAvMHg0MCBbZHJtXQo+ID4gWzMyODQwLjcwMjk3OF0gIGRybV9pb2N0bF9rZXJuZWwr
MHhhYS8weGYwIFtkcm1dCj4gPiBbMzI4NDAuNzAyOTkwXSAgZHJtX2lvY3RsKzB4MjA4LzB4Mzkw
IFtkcm1dCj4gPiBbMzI4NDAuNzAzMDAzXSAgPyBkcm1fbW9kZV9vYmpfZmluZF9wcm9wX2lkKzB4
NDAvMHg0MCBbZHJtXQo+ID4gWzMyODQwLjcwMzAwN10gID8gc2NoZWRfY2xvY2tfY3B1KzB4Yy8w
eGMwCj4gPiBbMzI4NDAuNzAzMDEyXSAgPyBsb2NrZGVwX2hhcmRpcnFzX29uKzB4ZjAvMHgxODAK
PiA+IFszMjg0MC43MDMwNTNdICBhbWRncHVfZHJtX2lvY3RsKzB4NDkvMHg4MCBbYW1kZ3B1XQo+
ID4gWzMyODQwLjcwMzA1OF0gIGRvX3Zmc19pb2N0bCsweDQxMS8weDc1MAo+ID4gWzMyODQwLjcw
MzA2NV0gIGtzeXNfaW9jdGwrMHg1ZS8weDkwCj4gPiBbMzI4NDAuNzAzMDY5XSAgX194NjRfc3lz
X2lvY3RsKzB4MTYvMHgyMAo+ID4gWzMyODQwLjcwMzA3Ml0gIGRvX3N5c2NhbGxfNjQrMHg1Yy8w
eGIwCj4gPiBbMzI4NDAuNzAzMDc2XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4
NDkvMHhiZQo+ID4gWzMyODQwLjcwMzA3OV0gUklQOiAwMDMzOjB4N2Y4YmNhYjBmMDBiCj4gPiBb
MzI4NDAuNzAzMDg0XSBDb2RlOiBCYWQgUklQIHZhbHVlLgo+ID4gWzMyODQwLjcwMzA4Nl0gUlNQ
OiAwMDJiOjAwMDA3ZmZlNzZjNjIzMzggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAw
MDAwMDAwMDAxMAo+ID4gWzMyODQwLjcwMzA4OV0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDog
MDAwMDdmZmU3NmM2MjM3MCBSQ1g6IDAwMDA3ZjhiY2FiMGYwMGIKPiA+IFszMjg0MC43MDMwOTJd
IFJEWDogMDAwMDdmZmU3NmM2MjM3MCBSU0k6IDAwMDAwMDAwYzAxODY0YmEgUkRJOiAwMDAwMDAw
MDAwMDAwMDA5Cj4gPiBbMzI4NDAuNzAzMDk0XSBSQlA6IDAwMDAwMDAwYzAxODY0YmEgUjA4OiAw
MDAwMDAwMDAwMDAwMDAzIFIwOTogMDAwMDAwMDBjMGMwYzBjMAo+ID4gWzMyODQwLjcwMzA5Nl0g
UjEwOiAwMDAwNTY0NzZjODZhMDE4IFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDA1NjQ3
NmM4YWQ5NDAKPiA+IFszMjg0MC43MDMwOThdIFIxMzogMDAwMDAwMDAwMDAwMDAwOSBSMTQ6IDAw
MDAwMDAwMDAwMDAwMDIgUjE1OiAwMDAwMDAwMDAwMDAwMDAzCj4gPiBbcm9vdEBsb2NhbGhvc3Qg
fl0jCj4gPiBbcm9vdEBsb2NhbGhvc3Qgfl0jIHBzIGF1eCB8IGdyZXAgZ25vbWUtc2hlbGwKPiA+
IG1pa2hhaWwgICAgIDE5MDAgIDAuMyAgMS4xIDY0NDc0OTYgMzc4Njk2IHR0eTIgICBEbCsgIEF1
ZzI0ICAgMjoxMCA+IC91c3IvYmluL2dub21lLXNoZWxsCj4gPiBtaWtoYWlsICAgICAyMDk5ICAw
LjAgIDAuMCA1MTk5ODQgMjMzOTIgPyAgICAgICAgU3NsICBBdWcyNCAgIDA6MDAgPiAvdXNyL2xp
YmV4ZWMvZ25vbWUtc2hlbGwtY2FsZW5kYXItc2VydmVyCj4gPiBtaWtoYWlsICAgIDEyMjE0ICAw
LjAgIDAuMCAzOTk0ODQgMjk2NjAgcHRzLzIgICAgU2wrICBBdWcyNCAgIDA6MDAgPiAvdXNyL2Jp
bi9weXRob24zIC91c3IvYmluL2Nocm9tZS1nbm9tZS1zaGVsbAo+ID4gY2hyb21lLWV4dGVuc2lv
bjovL2dwaGhhcG1lam9iaWpiYmhncGpoY2pvZ25sYWhibGVwLwo+ID4gcm9vdCAgICAgICAyMjk1
NyAgMC4wICAwLjAgMjE2MTIwICAyNDU2IHB0cy8xMCAgIFMrICAgMDM6NTkgICAwOjAwID4gZ3Jl
cCAtLWNvbG9yPWF1dG8gZ25vbWUtc2hlbGwKPiA+IAo+ID4gQWZ0ZXIgaXQsIEkgdHJpZWQgdG8g
a2lsbCBnbm9tZS1zaGVsbCBwcm9jZXNzIHdpdGggc2lnbmFsIDksIGJ1dCB0aGUKPiA+IHByb2Nl
c3Mgd29uJ3QgdGVybWluYXRlIGFmdGVyIHNldmVyYWwgdW5zdWNjZXNzZnVsIGF0dGVtcHRzLgo+
ID4gCj4gPiBPbmx5IFtBbHQgKyBQcm5TY3IgKyBCXSBoZWxwZWQgcmVib290IHRoZSBoYW5naW5n
IHN5c3RlbS4KPiA+IEkgYW0gd3JpdGluZyBoZXJlIGJlY2F1c2UgSSBob3BlIHNvbWUgYW1wZ3B1
IGhhY2tlcnMgY2FsIGxvb2sgaW4gdGhlCj4gPiB0cmFjZSBhbmQgdW5kZXJzdGFuZCB0aGF0IGlz
IGhhcHBlbmluZy4KPiA+IAo+ID4gU29ycnksIEkgZG9udCBrbm93IGhvdyB0byByZXByb2R1Y2Ug
dGhpcyBidWcuIEJ1dCB0aGUgcHJvYmxlbSBpdHNlbGYKPiA+IGlzIHZlcnkgYW5ub3lpbmcuCj4g
PiAKPiA+IFRoYW5rcy4KPiA+IAo+ID4gR1BVOiBBTUQgUmFkZW9uIFZJSQo+ID4gS2VybmVsOiA1
LjMgUkM1Cj4gPiAKPiBDYW4gd2UgdHJ5IHRvIGFkZCB0aGUgZmFsbGJhY2sgdGltZXIgbWFudWFs
bHk/Cj4gCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IEBAIC0z
MjIsNiArMzIyLDEwIEBAIGludCBhbWRncHVfZmVuY2Vfd2FpdF9lbXB0eShzdHJ1Y3QgYW1kZ3AK
PiAgCX0KPiAgCXJjdV9yZWFkX3VubG9jaygpOwo+ICAKPiArCWlmICghdGltZXJfcGVuZGluZygm
cmluZy0+ZmVuY2VfZHJ2LmZhbGxiYWNrX3RpbWVyKSkKPiArCQltb2RfdGltZXIoJnJpbmctPmZl
bmNlX2Rydi5mYWxsYmFja190aW1lciwKPiArCQkJamlmZmllcyArIChBTURHUFVfRkVOQ0VfSklG
RklFU19USU1FT1VUIDw8IDEpKTsKClRoaXMgd2lsbCBwYXBlciBvdmVyIHRoZSBpc3N1ZSwgYnV0
IHdvbid0IGZpeCBpdC4gZG1hX2ZlbmNlcyBoYXZlIHRvCmNvbXBsZXRlLCBhdCBsZWFzdCBmb3Ig
bm9ybWFsIG9wZXJhdGlvbnMsIG90aGVyd2lzZSB5b3VyIGRlc2t0b3Agd2lsbApzdGFydCBmZWVs
aW5nIGxpa2UgdGhlIGdwdSBoYW5ncyBhbGwgdGhlIHRpbWUuCgpJIHRoaW5rIHdvdWxkIGJlIG11
Y2ggbW9yZSBpbnRlcmVzdGluZyB0byBkdW1wIHdoaWNoIGZlbmNlIGlzbid0CmNvbXBsZXRpbmcg
aGVyZSBpbiB0aW1lLCBpLmUuIG5vdCBqdXN0IHRoZSB0aW1lb3V0LCBidXQgbG90cyBvZiBkZWJ1
ZwpwcmludGtzLgotRGFuaWVsCgo+ICsKPiAgCXIgPSBkbWFfZmVuY2Vfd2FpdChmZW5jZSwgZmFs
c2UpOwo+ICAJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gIAlyZXR1cm4gcjsKPiAtLQo+IAo+IE9y
IHNpbXBseSB3YWl0IHdpdGggYW4gZWFyIG9uIHNpZ25hbCBhbmQgdGltZW91dCBpZiBhZGRpbmcg
dGltZXIgc2VlbXMKPiB0byBnbyBhIGJpdCB0b28gZmFyPwo+IAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiBAQCAtMzIyLDcgKzMyMiwxMiBAQCBpbnQgYW1kZ3B1
X2ZlbmNlX3dhaXRfZW1wdHkoc3RydWN0IGFtZGdwCj4gIAl9Cj4gIAlyY3VfcmVhZF91bmxvY2so
KTsKPiAgCj4gLQlyID0gZG1hX2ZlbmNlX3dhaXQoZmVuY2UsIGZhbHNlKTsKPiArCWlmICgwIDwg
ZG1hX2ZlbmNlX3dhaXRfdGltZW91dChmZW5jZSwgdHJ1ZSwKPiArCQkJCUFNREdQVV9GRU5DRV9K
SUZGSUVTX1RJTUVPVVQgKwo+ICsJCQkJKEFNREdQVV9GRU5DRV9KSUZGSUVTX1RJTUVPVVQgPj4g
MykpKQo+ICsJCXIgPSAwOwo+ICsJZWxzZQo+ICsJCXIgPSAtRUlOVkFMOwo+ICAJZG1hX2ZlbmNl
X3B1dChmZW5jZSk7Cj4gIAlyZXR1cm4gcjsKPiAgfQo+IC0tCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
