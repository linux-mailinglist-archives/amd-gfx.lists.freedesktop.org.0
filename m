Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E3F71A14D
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Jun 2023 16:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B8410E566;
	Thu,  1 Jun 2023 14:59:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86910E566
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Jun 2023 14:59:31 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202306011659247212; Thu, 01 Jun 2023 16:59:24 +0200
Message-ID: <aca2a2e5-76c3-4df9-336e-2d9060333389@daenzer.net>
Date: Thu, 1 Jun 2023 16:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-CA
To: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 "Zhuo, Qingqing (Lillian)" <Qingqing.Zhuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chalmers, Wesley" <Wesley.Chalmers@amd.com>
References: <20230414155330.5215-11-Qingqing.Zhuo@amd.com>
 <9deeb132-a317-7419-e9da-cbc0a379c0eb@daenzer.net>
 <CH0PR12MB5284513F3548D749845BD7B48B769@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CH0PR12MB5284BDF5F23009597E1503E38B769@CH0PR12MB5284.namprd12.prod.outlook.com>
 <714c875f-21f1-7e29-fb39-4a1f97eb712f@daenzer.net>
 <14582e0e-58cb-02df-50ae-1af22d194b29@amd.com>
 <ea2f979e-730a-4bea-4092-3798f718ce0d@daenzer.net>
 <8e0d6d87-0f73-1ae0-bce8-8b6231e6c068@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 10/66] drm/amd/display: Do not set drr on pipe commit
In-Reply-To: <8e0d6d87-0f73-1ae0-bce8-8b6231e6c068@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F21.6478B24D.0003,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Chiu,
 Solomon" <Solomon.Chiu@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Gutierrez,
 Agustin" <Agustin.Gutierrez@amd.com>, "Kotarac, Pavle" <Pavle.Kotarac@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 5/31/23 22:14, Aurabindo Pillai wrote:
> On 5/11/23 03:06, Michel Dänzer wrote:
>> On 5/10/23 22:54, Aurabindo Pillai wrote:
>>> On 5/10/23 09:20, Michel Dänzer wrote:
>>>> On 5/9/23 23:07, Pillai, Aurabindo wrote:
>>>>>
>>>>> Sorry - the firmware in the previous message is for DCN32. For Navi2x, please use the firmware attached here.
>>>>
>>>> Same problem (contents of /sys/kernel/debug/dri/0/amdgpu_firmware_info below).
>>>>
>>>> Even if it did work with newer FW, the kernel must keep working with older FW, so in that case the new behaviour would need to be guarded by the FW version.
>>>>
>>>
>>> Agreed. Were you able to repro the hang on any other modes/monitors? 
>>
>> Haven't tried specifically, and this is the only system I have with VRR.
>>
>>
> Hi Michel,
> 
> I've fixed a related issue on Navi21. Could you please try the attached DMCUB along with the patches to be applied on top of amd-staging-drm-next and check if the hang/corruption is gone? 

Thanks, though I'm afraid that made it kind of worse: Now it already hangs when Steam starts up in Big Picture mode. Same with the new DMCUB firmware or older one.

This time, only

 amdgpu 0000:0c:00.0: [drm] *ERROR* [CRTC:82:crtc-0] flip_done timed out

appears in dmesg.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

