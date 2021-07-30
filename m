Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E23DB755
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jul 2021 12:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDF96E2DF;
	Fri, 30 Jul 2021 10:43:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BF276E2DF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Jul 2021 10:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3A49520201B;
 Fri, 30 Jul 2021 12:43:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id rNVMh94fF0Kt; Fri, 30 Jul 2021 12:43:10 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 0376120201A;
 Fri, 30 Jul 2021 12:43:09 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m9Pyv-0007cE-1q; Fri, 30 Jul 2021 12:43:09 +0200
To: =?UTF-8?Q?Ernst_Sj=c3=b6strand?= <ernstp@gmail.com>
References: <CAD=4a=WfpGqCD-kapdDCFOLVkdUo_Brb-UfnG==5T0ScSoiihw@mail.gmail.com>
 <d23e0c4d-7439-0c7a-32f9-7b13390bae5e@daenzer.net>
 <CAD=4a=XRAAa7OFQB0qJxxmvKhoMVBGyRVbGPQgFtrhpZWrCmHg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: Gmail throws all mailing list mails from amd.com in spam
Message-ID: <9235afb6-df9b-25d9-0913-c6dd0df77e00@daenzer.net>
Date: Fri, 30 Jul 2021 12:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAD=4a=XRAAa7OFQB0qJxxmvKhoMVBGyRVbGPQgFtrhpZWrCmHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2021-07-30 12:26 p.m., Ernst Sjöstrand wrote:
> Hmm no I think it's something with the domain. It specifically says
> "Be careful with this message
> Gmail could not verify that it actually came from amd.com <http://amd.com>. Avoid clicking links, downloading attachments, or replying with personal information."
> in a big yellow warning box.

The footer changed the mail body, which broke the DKIM signature.

Let me rephrase:

The footer was definitely one reason for DKIM related breakage. There might be more left though.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
