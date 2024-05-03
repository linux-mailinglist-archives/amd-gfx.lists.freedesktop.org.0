Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758E8BAD37
	for <lists+amd-gfx@lfdr.de>; Fri,  3 May 2024 15:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D798112A8D;
	Fri,  3 May 2024 13:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ieCEF/41";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921610E62E;
 Fri,  3 May 2024 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=djO+jz6xYJEHxcFn/5lCvtzQg53I8uvxmo3OJhTwkOk=; b=ieCEF/41LQxoXzoGnb79SeDXiX
 1CsfeMZytd2IRSpZ5U7TaE4RtBXsbS/deC1aXc1xP2tbPxwe7QFyVu5LN3zrU+dQCnSjZUsqX3zli
 pISiYIiUywpOnCNMuy03DLhhSqA8N9srs3S6AoimtEUqYccO/78rujQmhiMdSv7MP1LV12ylFN3CD
 3iR/9oZ44cr3lJVgWVOlgiqBQt+P4TCB/Z7wPdcGWtDXO18/FMBmkP1PdK6fZaKEv91SWxjqe+sf+
 Mv+FLcR7Q0SSUOmyEP9kui1PZ27/BSBdnKiSa1Frq79ALgM+fj4ne0J7c0J+CDaHQF7Eoxp0op4sJ
 oaCz217Q==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s2sUo-0007sY-P6; Fri, 03 May 2024 14:58:39 +0200
Message-ID: <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
Date: Fri, 3 May 2024 13:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
In-Reply-To: <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 May 2024 13:10:22 +0000
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


[And I forgot dri-devel.. doing well!]

On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> 
> [Correcting Christian's email]
> 
> On 03/05/2024 13:36, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Currently it is not well defined what is drm-memory- compared to other
>> categories.
>>
>> In practice the only driver which emits these keys is amdgpu and in them
>> exposes the total memory use (including shared).
>>
>> Document that drm-memory- and drm-total-memory- are aliases to prevent 
>> any
>> confusion in the future.
>>
>> While at it also clarify that the reserved sub-string 'memory' refers to
>> the memory region component.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.keonig@amd.com>
> 
> Mea culpa, I copied the mistake from 
> 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> 
> Regards,
> 
> Tvrtko
> 
>> Cc: Rob Clark <robdclark@chromium.org>
>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>> b/Documentation/gpu/drm-usage-stats.rst
>> index 6dc299343b48..ef5c0a0aa477 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -128,7 +128,9 @@ Memory
>>   Each possible memory type which can be used to store buffer objects 
>> by the
>>   GPU in question shall be given a stable and unique name to be 
>> returned as the
>> -string here.  The name "memory" is reserved to refer to normal system 
>> memory.
>> +string here.
>> +
>> +The region name "memory" is reserved to refer to normal system memory.
>>   Value shall reflect the amount of storage currently consumed by the 
>> buffer
>>   objects belong to this client, in the respective memory region.
>> @@ -136,6 +138,9 @@ objects belong to this client, in the respective 
>> memory region.
>>   Default unit shall be bytes with optional unit specifiers of 'KiB' 
>> or 'MiB'
>>   indicating kibi- or mebi-bytes.
>> +This is an alias for drm-total-<region> and only one of the two 
>> should be
>> +present.
>> +
>>   - drm-shared-<region>: <uint> [KiB|MiB]
>>   The total size of buffers that are shared with another file (e.g., 
>> have more
>> @@ -145,6 +150,9 @@ than a single handle).
>>   The total size of buffers that including shared and private memory.
>> +This is an alias for drm-memory-<region> and only one of the two 
>> should be
>> +present.
>> +
>>   - drm-resident-<region>: <uint> [KiB|MiB]
>>   The total size of buffers that are resident in the specified region.
