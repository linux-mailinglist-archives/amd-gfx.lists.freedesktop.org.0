Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AB2D8A08
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 09:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820726E8D3;
	Wed, 16 Oct 2019 07:43:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00F6E894
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 20:26:41 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id r5so32650483qtd.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 13:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GvhT2QXQ0GgfNEOJ+UXo4IMteX3tSISiPGXC9WqcO04=;
 b=NVlehJmLDuSTkIv+fD9cFJei6488Woyd/JB0+tyKlVVH/izHOUKg3R8MwsERpHrPrU
 /LHehLCDNms9g5x6kDsvmhMQiIfoQlYngo/4TH887bwTK3ykV/eiL0qKZ98QIMD4CxVH
 xnnuC6I88jE9eL489qAzbi+5/2PzrxAyZNxS+96k3IvSfQvG/EoTH887WP/tH7GuklbD
 Om1I6OnvRoZ8KS3NQy9SmPsFEhnfis+1EUMaY8QTt/DEcCkKc4hZApPA5xrPG1lRsu/P
 ocvNwIpf6hTgPqNKNeXKEmhDlxIIAC5YUt6CO/JH/qf9rLU6hPDkglFDFgx1vhNPzweO
 9B+w==
X-Gm-Message-State: APjAAAXZzgqyuoKqwlVOF5QlM8+b92iYwMpx48faRJ0DBWfgToqaG6Q7
 JkeCDtVKeWJaqLh4l8GBHz0=
X-Google-Smtp-Source: APXvYqwtYOxc82LyDC2x14XH4mC20IbSYpCrolbjZ14JzYy7i9d3lsO8aDajJqSlG0bphVKBySVxfQ==
X-Received: by 2002:ac8:6a06:: with SMTP id t6mr18025686qtr.169.1571171200885; 
 Tue, 15 Oct 2019 13:26:40 -0700 (PDT)
Received: from rani ([2001:470:1f07:5f3:9e5c:8eff:fe50:ac29])
 by smtp.gmail.com with ESMTPSA id u43sm12322018qte.19.2019.10.15.13.26.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 13:26:40 -0700 (PDT)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani>
Date: Tue, 15 Oct 2019 16:26:38 -0400
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: AMDGPU and 16B stack alignment
Message-ID: <20191015202636.GA1671072@rani>
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:43:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GvhT2QXQ0GgfNEOJ+UXo4IMteX3tSISiPGXC9WqcO04=;
 b=RNSQmhS1SULpv8GZPCiu5asQAlQF6Idx3EhdWxGneLmOdNMY9oR8myuMsapb1DryrK
 JBD6v8okCUJuTqICjRdcFSYW1axwy9SxM+N0lWTx6tlO6SPJIcCz19WgfLDH/PiXDs88
 ozWURoS8goNos1zOqmD9OC2VT8ARi5cisOYuCuWxKln5eFQgkcEkOf0GGWawAijG2ZzB
 UKBxQ5Xj7mVy4DL0SGFNrROu0T4HRn0ookLg1iEIBE08ArG8ToWHPwViGxIzfVXTNXlo
 bSRxYFAzZJ/vm0edZXfUtkOSRC0I7tsOTSe+omVg/ruYNOINoAVUx9uPuTQSkFO0XNcd
 t9UA==
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
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MDU6NTZBTSAtMDcwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBIbW1tLi4uSSB3b3VsZCBoYXZlIGxpa2VkIHRvIHJlbW92ZSBpdCBvdXRyaWdo
dCwgYXMgaXQgaXMgYW4gQUJJCj4gbWlzbWF0Y2ggdGhhdCBpcyBsaWtlbHkgdG8gcmVzdWx0IGlu
IGluc3RhYmlsaXR5IGFuZCBub24tZnVuLXRvLWRlYnVnCj4gcnVudGltZSBpc3N1ZXMgaW4gdGhl
IGZ1dHVyZS4gIEkgc3VzcGVjdCBteSBwYXRjaCBkb2VzIHdvcmsgZm9yIEdDQwo+IDcuMSsuICBU
aGUgcXVlc3Rpb24gaXM6IERvIHdlIHdhbnQgdG8gZWl0aGVyOgo+IDEuIG1hcmsgQU1ER1BVIGJy
b2tlbiBmb3IgR0NDIDwgNy4xLCBvcgo+IDIuIGNvbnRpbnVlIHN1cHBvcnRpbmcgaXQgdmlhIHN0
YWNrIGFsaWdubWVudCBtaXNtYXRjaD8KPiAKPiAyIGlzIGJyaXR0bGUsIGFuZCBtYXkgYnJlYWsg
YXQgYW55IHBvaW50IGluIHRoZSBmdXR1cmUsIGJ1dCBpZiBpdCdzCj4gd29ya2luZyBmb3Igc29t
ZW9uZSBpdCBkb2VzIG1ha2UgbWUgZmVlbCBiYWQgdG8gb3V0cmlnaHQgZGlzYWJsZSBpdC4KPiBX
aGF0IEknZCBpbWFnZSAyIGxvb2tzIGxpa2UgaXMgKHBzdWVkbyBjb2RlIGluIGEgTWFrZWZpbGUp
Ogo+IAo+IGlmIENDX0lTX0dDQyAmJiBHQ0NfVkVSU0lPTiA8IDcuMToKPiAgIHNldCBzdGFjayBh
bGlnbm1lbnQgdG8gMTZCIGFuZCBob3BlIGZvciB0aGUgYmVzdAo+IAo+IFNvIG15IGRpZmYgd291
bGQgYmUgYW1lbmRlZCB0byBrZWVwIHRoZSBzdGFjayBhbGlnbm1lbnQgZmxhZ3MsIGJ1dAo+IG9u
bHkgdG8gc3VwcG9ydCBHQ0MgPCA3LjEuICBBbmQgdGhhdCBhc3N1bWVzIG15IGNoYW5nZSBjb21w
aWxlcyB3aXRoCj4gR0NDIDcuMSsuIChMb29rcyBsaWtlIGl0IGRvZXMgZm9yIG1lIGxvY2FsbHkg
d2l0aCBHQ0MgOC4zLCBidXQgSSB3b3VsZAo+IGZlZWwgZXZlbiBtb3JlIGNvbmZpZGVudCBpZiBz
b21lb25lIHdpdGggaGFyZHdhcmUgdG8gdGVzdCBvbiBhbmQgR0NDCj4gNy4xKyBjb3VsZCBib290
IHRlc3QpLgo+IC0tIAo+IFRoYW5rcywKPiB+TmljayBEZXNhdWxuaWVycwoKSWYgd2UgZG8ga2Vl
cCBpdCwgd291bGQgYWRkaW5nIC1tc3RhY2tyZWFsaWduIG1ha2UgaXQgbW9yZSByb2J1c3Q/ClRo
YXQncyBzaW1wbGUgYW5kIHdpbGwgb25seSBhZGQgdGhlIGFsaWdubWVudCB0byBmdW5jdGlvbnMg
dGhhdCByZXF1aXJlCjE2LWJ5dGUgYWxpZ25tZW50IChhdCBsZWFzdCBvbiBnY2MpLgoKQWx0ZXJu
YXRpdmUgaXMgdG8gdXNlCl9fYXR0cmlidXRlX18oKGZvcmNlX2FsaWduX2FyZ19wb2ludGVyKSkg
b24gZnVuY3Rpb25zIHRoYXQgbWlnaHQgYmUKY2FsbGVkIGZyb20gOC1ieXRlLWFsaWduZWQgY29k
ZS4KCkl0IGxvb2tzIGxpa2UgLW1zdGFja3JlYWxpZ24gc2hvdWxkIHdvcmsgZnJvbSBnY2MgNS4z
IG9ud2FyZHMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
