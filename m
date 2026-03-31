Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGXEDofEy2nsLgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 14:56:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED14369D06
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 14:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095210EC4E;
	Tue, 31 Mar 2026 12:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gg70urw6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1710EC4A;
 Tue, 31 Mar 2026 12:56:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4flSmY5yvWz9txF;
 Tue, 31 Mar 2026 14:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1774961789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fR4tNqzFAaNjfM1ALkgthuV0izYT7IoG9clnVyc5I2Y=;
 b=gg70urw6KJnGO60ZcSCVK5vpTyL8rdBLOZc/+S7EZ2NQ83hfI5P4Zo6kfr7gUgQu5X/0/7
 5eGZIQKSzvEKUIuCtG8AsDN2t5ktDffSmyGeBQ1ZsbU48iS7Lz53bgBCbm2CmuE+4+qZDt
 4kazYhJxV+Ryl60Dcxelngt6izjc5bTbN3NtgjfAAsg0JUsaxD0TMsSnNgVk8tQxg++j1R
 2PgT1hF0DcPrbg9dTIfte2wWzde53GyqpmskFWpD+CXu7h4zWNFpIhEd6oJIfVJSFGeI2n
 tG8zPxG/IvHOUUgVIAFHPQUTwZYvudawTaIiNzlhR7CImGycEecNJCgono8Law==
Message-ID: <d9abba15-382d-4bc1-a58a-71bb8413eeac@mailbox.org>
Date: Tue, 31 Mar 2026 14:56:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <8676926.T7Z3S40VBb@workhorse>
 <eff61423-a854-44c1-8634-30e2bd61e005@mailbox.org>
 <4265353.aeNJFYEL58@workhorse>
 <254c20a4-cce3-4c8e-9902-514586f3e694@mailbox.org>
 <20260326155305.736b4e64@fluorite>
 <47325395-3790-4cb4-8efd-84a3d8ddb80c@mailbox.org>
 <20260331153805.376486e2@fluorite>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260331153805.376486e2@fluorite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3ea22b55c6cef5a3c0b
X-MBO-RS-META: ru88ojqwgmnp6kdirxom5z1d59n5o6gg
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DED14369D06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 14:38, Pekka Paalanen wrote:
> On Tue, 31 Mar 2026 10:01:59 +0200
> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>> On 3/26/26 14:53, Pekka Paalanen wrote:
>>> On Tue, 24 Mar 2026 17:44:21 +0100
>>> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>>   
>>>> * There's no clear use case.
>>>>
>>>> This is generally a requirement for new KMS UAPI.
>>>>
>>>> The practical usefulness of the corresponding weston MR is dubious
>>>> per the concern above.  
>>>
>>> I think the example of RGB 10 bpc to be degraded to YCbCr 10 bpc
>>> rather than RGB 8 bpc is an excellent use case.  
>>
>> This series and the corresponding Weston MR aren't enough to address
>> that use case though, are they? All they achieve is logging a
>> potentially misleading warning.
>>
>> It might make sense to combine this series and the Weston MR with
>> whatever else is needed for that use case.
> 
> What do you believe is missing?

For the stated use case, e.g. a mechanism to control RGB vs YCbCr?


> Informing the user that the display quality may not be as expected is
> the point.

The warning implies that the "link bpc" value is expected to match the "max bpc" value, which generally isn't the case.


>>> I had another use case in
>>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850#note_3115686  
>>
>> That would need to take dithering into account as well?
> 
> Yes, dithering could be an adverse effect or not sufficient. Hence the
> 'link bpc' property should not consider any kind of dithering, to be on
> the safe side. I fully expect dithering to become explicitly
> controllable, as policy belongs in userspace.

I agree that would be ideal, alas it's not current reality.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
