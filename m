Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001DD9AA9
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 22:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEEF6E430;
	Wed, 16 Oct 2019 20:01:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40686E9CC
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 18:55:03 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v52so37658935qtb.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 11:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=215ZBerRTMMvl/Ijng0HKjRnsXOqsXt0a9H0WhV1Gdk=;
 b=U729uaS4tw3mAf2kqxJNzSWpouiNXBTHL8SVWB7BQKH/2TmB9c6q4IrcrXDM+7Oo2f
 rttw9mUkhS4hzMhsoUQjQGEURyyVzfKUT/cCl+UPhZhq2A4UG1YFbdumagy2LXkh0mjd
 gOaJG21BWqPqfFuy5hUlaTB1dH7nAL7YjGoJhntrw37k9bRCyKApvNhud8Vr8XAIxVM7
 moVIHXTLnxkLeq8af/AUDrnHr1G2hT5gpnRW/xIw6TveaMFGLWElwX77de2GR7unq0HX
 eBxXMASQRkZanNeXPz4bpOI26IY7/+jVQjvLrDLo4A7vCGYAPPURAtsEqUmfbQO/PPKQ
 Yn0w==
X-Gm-Message-State: APjAAAWMKKA48DIA8cCRTnUnFQvBg0ywV1cV8maf5nQoxcTscxE9v4SU
 ZMrbH7R16w+GGNadMZ65X5U=
X-Google-Smtp-Source: APXvYqxzTERqBQzFzqsZvJZcXfJfiW/6hYpbVzuLshfRe9ZdrNWNNzJxc2ZlnwryCz/df2jpkY8Hqg==
X-Received: by 2002:a0c:f787:: with SMTP id s7mr43874485qvn.221.1571252102649; 
 Wed, 16 Oct 2019 11:55:02 -0700 (PDT)
Received: from rani ([2001:470:1f07:5f3:9e5c:8eff:fe50:ac29])
 by smtp.gmail.com with ESMTPSA id z6sm11165855qkf.125.2019.10.16.11.55.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 11:55:02 -0700 (PDT)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani>
Date: Wed, 16 Oct 2019 14:55:00 -0400
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: AMDGPU and 16B stack alignment
Message-ID: <20191016185500.GA2674383@rani>
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
 <20191015202636.GA1671072@rani>
 <CAKwvOd=yGXMwdoxKCD2gcEgevozf41jVmqCkW7CU=Xvd7mqtjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=yGXMwdoxKCD2gcEgevozf41jVmqCkW7CU=Xvd7mqtjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 16 Oct 2019 20:01:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=215ZBerRTMMvl/Ijng0HKjRnsXOqsXt0a9H0WhV1Gdk=;
 b=dFNgX47+yn5y5aSzyG5fvds+4iZz2ZVcygnhlO/TFDDGxgLapBFuqKVnexxrntaUr6
 fiArRNNdIKP4qK0Em+wCpsO75GsiMqBVV2DOdMCJz/1/pbRGFwINU0uKinfUqZdP1dGA
 FTGEllIAVag49z4efR4OkmnHckUoM1s2tfLLmYpLFwTdT3UVM/CS/AXXtX4q/EmM+SfZ
 VD8kR+1rc5bBqhBBsvzXqjeTkZm41brj1KB7Kdq8Zjip2e08o4AhrWjzBYN2ciQyLFqo
 q2AiPBEozgmUXBPJJsk+ibrR99Pi9LjlcJZN44/zk8ZeQg48UJsSIEzg+OAsZXlwVHLA
 aV7g==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@google.com>, "S,
 Shirish" <sshankar@amd.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, "yshuiv7@gmail.com" <yshuiv7@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDY6NTE6MjZQTSAtMDcwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAxOjI2IFBNIEFydmluZCBTYW5rYXIg
PG5pdmVkaXRhQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3QgMTUsIDIw
MTkgYXQgMTE6MDU6NTZBTSAtMDcwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiA+ID4gSG1t
bS4uLkkgd291bGQgaGF2ZSBsaWtlZCB0byByZW1vdmUgaXQgb3V0cmlnaHQsIGFzIGl0IGlzIGFu
IEFCSQo+ID4gPiBtaXNtYXRjaCB0aGF0IGlzIGxpa2VseSB0byByZXN1bHQgaW4gaW5zdGFiaWxp
dHkgYW5kIG5vbi1mdW4tdG8tZGVidWcKPiA+ID4gcnVudGltZSBpc3N1ZXMgaW4gdGhlIGZ1dHVy
ZS4gIEkgc3VzcGVjdCBteSBwYXRjaCBkb2VzIHdvcmsgZm9yIEdDQwo+ID4gPiA3LjErLiAgVGhl
IHF1ZXN0aW9uIGlzOiBEbyB3ZSB3YW50IHRvIGVpdGhlcjoKPiA+ID4gMS4gbWFyayBBTURHUFUg
YnJva2VuIGZvciBHQ0MgPCA3LjEsIG9yCj4gPiA+IDIuIGNvbnRpbnVlIHN1cHBvcnRpbmcgaXQg
dmlhIHN0YWNrIGFsaWdubWVudCBtaXNtYXRjaD8KPiA+ID4KPiA+ID4gMiBpcyBicml0dGxlLCBh
bmQgbWF5IGJyZWFrIGF0IGFueSBwb2ludCBpbiB0aGUgZnV0dXJlLCBidXQgaWYgaXQncwo+ID4g
PiB3b3JraW5nIGZvciBzb21lb25lIGl0IGRvZXMgbWFrZSBtZSBmZWVsIGJhZCB0byBvdXRyaWdo
dCBkaXNhYmxlIGl0Lgo+ID4gPiBXaGF0IEknZCBpbWFnZSAyIGxvb2tzIGxpa2UgaXMgKHBzdWVk
byBjb2RlIGluIGEgTWFrZWZpbGUpOgo+ID4gPgo+ID4gPiBpZiBDQ19JU19HQ0MgJiYgR0NDX1ZF
UlNJT04gPCA3LjE6Cj4gPiA+ICAgc2V0IHN0YWNrIGFsaWdubWVudCB0byAxNkIgYW5kIGhvcGUg
Zm9yIHRoZSBiZXN0Cj4gPiA+Cj4gPiA+IFNvIG15IGRpZmYgd291bGQgYmUgYW1lbmRlZCB0byBr
ZWVwIHRoZSBzdGFjayBhbGlnbm1lbnQgZmxhZ3MsIGJ1dAo+ID4gPiBvbmx5IHRvIHN1cHBvcnQg
R0NDIDwgNy4xLiAgQW5kIHRoYXQgYXNzdW1lcyBteSBjaGFuZ2UgY29tcGlsZXMgd2l0aAo+ID4g
PiBHQ0MgNy4xKy4gKExvb2tzIGxpa2UgaXQgZG9lcyBmb3IgbWUgbG9jYWxseSB3aXRoIEdDQyA4
LjMsIGJ1dCBJIHdvdWxkCj4gPiA+IGZlZWwgZXZlbiBtb3JlIGNvbmZpZGVudCBpZiBzb21lb25l
IHdpdGggaGFyZHdhcmUgdG8gdGVzdCBvbiBhbmQgR0NDCj4gPiA+IDcuMSsgY291bGQgYm9vdCB0
ZXN0KS4KPiA+ID4gLS0KPiA+ID4gVGhhbmtzLAo+ID4gPiB+TmljayBEZXNhdWxuaWVycwo+ID4K
PiA+IElmIHdlIGRvIGtlZXAgaXQsIHdvdWxkIGFkZGluZyAtbXN0YWNrcmVhbGlnbiBtYWtlIGl0
IG1vcmUgcm9idXN0Pwo+ID4gVGhhdCdzIHNpbXBsZSBhbmQgd2lsbCBvbmx5IGFkZCB0aGUgYWxp
Z25tZW50IHRvIGZ1bmN0aW9ucyB0aGF0IHJlcXVpcmUKPiA+IDE2LWJ5dGUgYWxpZ25tZW50IChh
dCBsZWFzdCBvbiBnY2MpLgo+IAo+IEkgdGhpbmsgdGhlcmUncyBhbHNvIGAtbWluY29taW5nLXN0
YWNrLWJvdW5kYXJ5PWAuCj4gaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51
eC9pc3N1ZXMvNzM1I2lzc3VlY29tbWVudC01NDAwMzgwMTcKClllcywgYnV0IC1tc3RhY2tyZWFs
aWduIGxvb2tzIGxpa2UgaXQncyBzdXBwb3J0ZWQgYnkgY2xhbmcgYXMgd2VsbC4KPiAKPiA+Cj4g
PiBBbHRlcm5hdGl2ZSBpcyB0byB1c2UKPiA+IF9fYXR0cmlidXRlX18oKGZvcmNlX2FsaWduX2Fy
Z19wb2ludGVyKSkgb24gZnVuY3Rpb25zIHRoYXQgbWlnaHQgYmUKPiA+IGNhbGxlZCBmcm9tIDgt
Ynl0ZS1hbGlnbmVkIGNvZGUuCj4gCj4gV2hpY2ggaXMgaGFyZCB0byBhdXRvbWF0ZSBhbmQgZWFz
eSB0byBmb3JnZXQuICBMaWtlbHkgYSBsYXJnZSBkaWZmIHRvIGZpeCB0b2RheS4KClJpZ2h0LCB0
aGlzIGlzIGEgbm8tZ28sIGVzcCB0byBqdXN0IGZpeCBvbGQgY29tcGlsZXJzLgo+IAo+ID4KPiA+
IEl0IGxvb2tzIGxpa2UgLW1zdGFja3JlYWxpZ24gc2hvdWxkIHdvcmsgZnJvbSBnY2MgNS4zIG9u
d2FyZHMuCj4gCj4gVGhlIGtlcm5lbCB3b3VsZCBnZW5lcmFsbHkgbGlrZSB0byBzdXBwb3J0IEdD
QyA0LjkrLgo+IAo+IFRoZXJlJ3MgcGxlbnR5IG9mIGRpZmZlcmVudCB3YXlzIHRvIGtlZXAgbGF5
ZXJpbmcgb24gZHVjdCB0YXBlIGFuZAo+IGJhaWxpbmcgd2lyZSB0byBzdXBwb3J0IGRpZmZlcmlu
ZyBBQklzLCBidXQgdGhhdCdzIGp1c3QgYWRkaW5nCj4gdGVjaG5pY2FsIGRlYnQgdGhhdCB3aWxs
IGhhdmUgdG8gYmUgcmVwYWlkIG9uZSBkYXkuICBUaGF0J3Mgd2h5IHRoZQo+IGNsZWFuZXN0IHNv
bHV0aW9uIElNTyBpcyBtYXJrIHRoZSBkcml2ZXIgYnJva2VuIGZvciBvbGQgdG9vbGNoYWlucywK
PiBhbmQgdXNlIGEgY29kZS1iYXNlLWNvbnNpc3RlbnQgc3RhY2sgYWxpZ25tZW50LiAgQmVuZGlu
ZyBvdmVyCj4gYmFja3dhcmRzIHRvIHN1cHBvcnQgb2xkIHRvb2xjaGFpbnMgbWVhbnMgYWNjZXB0
aW5nIHN0YWNrIGFsaWdubWVudAo+IG1pc21hdGNoZXMsIHdoaWNoIGlzIGluIHRoZSAidW5zcGVj
aWZpZWQgYmVoYXZpb3IiIHJpbmcgb2YgdGhlCj4gInVuZGVmaW5lZCBiZWhhdmlvciIgVmVubiBk
aWFncmFtLiAgSSBoYXZlIHRoZSBzYW1lIG9waW5pb24gb24gcmVseWluZwo+IG9uIGV4cGxpY2l0
bHkgdW5kZWZpbmVkIGJlaGF2aW9yLgo+IAo+IEknbGwgc2VuZCBwYXRjaGVzIGZvciBmaXhpbmcg
dXAgQ2xhbmcsIGJ1dCBwbGVhc2UgY29uc2lkZXIgbXkgc3Ryb25nCj4gYWR2aWNlIHRvIGdlbmVy
YWxseSBhdm9pZCBzdGFjayBhbGlnbm1lbnQgbWlzbWF0Y2hlcywgcmVnYXJkbGVzcyBvZgo+IGNv
bXBpbGVyLgo+IC0tCj4gVGhhbmtzLAo+IH5OaWNrIERlc2F1bG5pZXJzCgpXaGF0IEkgc3VnZ2Vz
dGVkIHdhcyBpbiByZWZlcmVuY2UgdG8geW91ciBwcm9wb3NhbCBmb3IgZHJvcHBpbmcgdGhlCi1t
cHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQgZm9yIG1vZGVybiBjb21waWxlcnMsIGJ1dCBrZWVw
aW5nIGl0IGZvcgo8Ny4xLiAtbXN0YWNrcmVhbGlnbiB3b3VsZCBhdCBsZWFzdCBsZXQgNS4zIG9u
d2FyZHMgYmUgbGVzcyBsaWtlbHkgdG8KYnJlYWsgKGFuZCBpdCBkb2Vzbid0IGVycm9yIGJlZm9y
ZSB0aGVuLCBJIHRoaW5rIGl0IGp1c3QgZG9lc24ndAphY3R1YWxseSBkbyBhbnl0aGluZywgc28g
bm8gd29yc2UgdGhhbiBub3cgYXQgbGVhc3QpLgoKU2ltcGx5IGRyb3BwaW5nIHN1cHBvcnQgZm9y
IDw3LjEgd291bGQgYmUgY2xlYW5lc3QsIHllcywgYnV0IGl0IHNvdW5kcwpsaWtlIHBlb3BsZSBk
b24ndCB3YW50IHRvIGdvIHRoYXQgZmFyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
