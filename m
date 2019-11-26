Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4110A4AD
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2019 20:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD616E14E;
	Tue, 26 Nov 2019 19:44:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.cyber.ee (mx2.cyber.ee [193.40.6.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D4F6E184;
 Tue, 26 Nov 2019 17:46:27 +0000 (UTC)
Subject: Re: radeon UBSAN warning from user syscall
To: Alex Deucher <alexdeucher@gmail.com>
References: <70afeeda-e6a5-4c3b-2691-efe282472fa1@linux.ee>
 <CADnq5_PUgfHjvwYiYO26aTKMUAShGD5jQ=bSL+-is2Ws17BMGQ@mail.gmail.com>
From: Meelis Roos <mroos@linux.ee>
Message-ID: <34470725-7707-04d7-d5d6-5d3b6ae1aa9b@linux.ee>
Date: Tue, 26 Nov 2019 19:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CADnq5_PUgfHjvwYiYO26aTKMUAShGD5jQ=bSL+-is2Ws17BMGQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 26 Nov 2019 19:44:20 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBMb29rcyBsaWtlIHRoZSBzaGlmdCBhbmQgbWFzayBhcmUgcmV2ZXJzZWQuICBEb2VzIHRoaXMg
cGF0Y2ggZml4IGl0PwoKWWVzLCB0aGUgd2FybmluZyBpcyBnb25lIGFuZCBpdCBzdGlsbCB3b3Jr
cy4gVGhhbmsgeW91IQoKVGVzdGVkLWJ5OiBNZWVsaXMgUm9vcyA8bXJvb3NAbGludXguZWU+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
