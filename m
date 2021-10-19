Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E42A432F47
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Oct 2021 09:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1496EB1B;
	Tue, 19 Oct 2021 07:23:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410B6EB1B
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Oct 2021 07:23:35 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aef98.dynamic.kabel-deutschland.de
 [95.90.239.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6675761E5FE00;
 Tue, 19 Oct 2021 09:23:33 +0200 (CEST)
Subject: Re: [PATCH 0/5] Remove 0 MHz as a valid current frequency (v4)
To: Luben Tuikov <luben.tuikov@amd.com>
References: <20211018234913.42349-1-luben.tuikov@amd.com>
Cc: amd-gfx@lists.freedesktop.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <a653a699-69a9-9671-4bfd-e02f3d22fc2f@molgen.mpg.de>
Date: Tue, 19 Oct 2021 09:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018234913.42349-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Luben,


Sorry, two more style nits.

1.  Could you please use 75 characters per line for the text width of 
the commit messages. Currently, especially 4/5, are hard to read being 
so short.

2.  No idea, what is done in amd-gfx, but for me it is more common to 
put the iteration number (reroll count) in the PATCH tag in the 
beginning. No idea, how Patchwork deals with it.


Kind regards,

Paul
