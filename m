Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2B669D7E
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jan 2023 17:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BB410EA30;
	Fri, 13 Jan 2023 16:19:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A7C10EA30;
 Fri, 13 Jan 2023 16:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUgrKw0TvT3U2oeyca1jC7ZR09TPoc/lReLOE86PGu5iOjUEO8Q2FshQdFRW54GtIQZS5hFWCfpT1Sdqbsq4yP6j1V9+acni0rlEn1oP/Srca5XdBX3Mx0shN2prhKj1SS1q85ONjxLmZ+YiAEeZ4beo+uWaaui2oKJTUSRWQbMemXfPlr23SrptzBgnBpzdoBaVBNSVhhA0UQzpQMucDUd2lrXmekESquI3pFBKmIKcHYkAW23YRjIhCnAz5UzrsB+31llSYgZxkzFH/LPBoTW67Q99fQSV5fS7wpMjppay5a+wUu8eP/iZIHFlGtRhGMImKggohJtDp5qMCh2mSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=651dXy521/aiXOTVGeHI3NbLShoFJ8sxnMK5lJhXM/E=;
 b=fms+N+fcetdBTFIvzhyGjkjfdxDcd2wrwTLh6gjoDDJ142hkvwZWT0io0IBsVAvqwBgCXIyhrNX8jYddM767npW2mWxdBFh6IV5XQq0N1aIfOYH7pKkaDFSJI9q80kEeEMjreCpd2ANQ8R0PkA04LEDQQM+70yJun0Cd1riZbWtfYcw0DPaezg/iqnNFBJNalmyyiFOATDRGUJjO+V27iCgq9+etHrHda1AsngBqNCMLSna/LIaQxk4blsoW/B/khQ/KzjXxMW+rbFPHyeGAEXFMSW8ipKUMWQyF/RTomlkUsH9kmk//SBGexmJI1/3JCPGrGlXSsRRqePz7/OdmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=651dXy521/aiXOTVGeHI3NbLShoFJ8sxnMK5lJhXM/E=;
 b=nyVZ3H+XkUHX50pOcaTvBs8sAcoR/V2nqUcQNs1A6oJehOnRVIVxhRmkpV4YSEKOdUIjdNTuzxZb5fCGK1eyU8PVGDZP7hx9OdsBHbtf2TIUz10RulNsqqLe3Bx6zVvJj20ynQ6ipcUwLkdmj+7tYxT7/dIPaP5dxmJaZqn64ZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:19:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 16:19:37 +0000
Message-ID: <fb17e914-6b21-0860-9386-31e739480ba6@amd.com>
Date: Fri, 13 Jan 2023 11:19:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <877cxqg2na.fsf@intel.com> <Y8ExtuE8fFyNnnXh@phenom.ffwll.local>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y8ExtuE8fFyNnnXh@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c94460-c686-465f-06c3-08daf581f6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIFDU6NKdOIxfGZu+9ZDvT8N7twuxBSp2l09h20RHVxP7AkowRyezTB/icXe8mbQHCKohi7vNush+u6/yogkTu9hEGYEVN8C9DWFkqVi51Y4krllXSNvu46IZRpSnjpb4im+8k/3UgLNERU2Y8hu66ptTc4veC7waPdoNrAi0sRb2A9nSWIbeeZ4+CzWjEA2vlpvKaLfkkbzukYLMGKemXdzKnpVhm6q4Bnt5gMsNuv35ebf6f9fJ4G7g2zj2ozGW+KlVMT1ctWP6aRSafFhz5wRI6wqqmdWtWNrl2/c4UlA0Xkp+D5bEod8sWnzqRYwjI1hmnSyn1BNBqkshhoXRy6OUc1h9CntcsuTXtRllVmRSAf0iVaCvDWsg3lYhhQ9MVm1YtSUNI+u/mv23baI3yZIErRhTi1dYhUKMJd79GPo02zOFsu3fkgaElRZRtJbDS3rGJoy7SWfyR2+HOllDis1L8n51slAAXycwcPvrbwqu+5VP51r9OEhoOlsViDyv2LtMUYlmfvoCXE2eQHrqGIGtwgdXYAZJFD2rfo7k+UKAPzBkYZRX2louyGdwi2EKlF8I0aNCuF06g2yHZbdAjyJk0a9nS24wyYzafSld2l69pH9lyjV9Fw0vjvpBoIthPAzbd+OQiXH0N32cDZdrmbKlzJxd5NtDdM2od1uWsqU+CyNf35/5eomNz6CHPWT0Lp5FqbsHU6zgA+E48amPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(66899015)(36756003)(31686004)(86362001)(8676002)(66946007)(83380400001)(4326008)(66556008)(110136005)(54906003)(41300700001)(66476007)(31696002)(38100700002)(6506007)(26005)(6486002)(186003)(66574015)(966005)(6666004)(5660300002)(8936002)(316002)(44832011)(53546011)(478600001)(2906002)(30864003)(6512007)(2616005)(21314003)(45980500001)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5kYW1oa0JXREtTTkd0TEszem83aEx4SGtUVFpVVzNSRU5ubHh1Y083QllS?=
 =?utf-8?B?emsrMXA1dEZrenJXVmZMbjZBMnlQYXhLL3hZcTVZU3F4YXp1T0xsUXBTRWt1?=
 =?utf-8?B?UUEwZjFTb0FXZkpWS2hUYnlDNkRidUtINDB5MUF4TzMyelhCRStIRzRtRHo1?=
 =?utf-8?B?V25WVFR1MVFaamkzVEs4THVGK2lYcUVFMzlDU0x2dzVLZzJiMjU2VWVPUjNv?=
 =?utf-8?B?UlQxZDgzZmhqVnNuTHhNOHk4VVJicTVUMnBUL3duWGZibDFBQUtNZVM5MlRX?=
 =?utf-8?B?TUxYRDBlNmdNY09ZVkFXOEsxTDVkZ3c4L1hON0cwVkNRTnVjY1JmUzFMSHhk?=
 =?utf-8?B?dkVxdnFwbG5lU0E2UVBpaHFpZGJPQWUrbVJOSVhRT1pCeE9icVFpanFYMHhH?=
 =?utf-8?B?Z09iY09ZSGNFdGdBbnVRQ2l1SUJOS2gwNHpFNHBKUSs1cW9qRzlXR2VCcm80?=
 =?utf-8?B?SEZhc0x1M0xtZFFZWXAxdzZuSGl3YXhkZEhwYTRHVVJqR0ZqekZvS3hWM045?=
 =?utf-8?B?RXhKVExWcUM4b3hSb1JiWDlLMnhrakpxZGI4dnRXQjcwSHNGcndIUmg3Vzhz?=
 =?utf-8?B?VG1ZWEpmZDRyUnVnb2FWQ0NlT1dpYmowY3NDeS9aWGpIaUdWWWp6QnZrNFVM?=
 =?utf-8?B?d2R4ZWt6ZnZWV3VFMFY2b0t6RldtOFA4VDdpQXc5bTcwTk0zUUNsS1Izd0Jo?=
 =?utf-8?B?Nmx0b3d5Ym9nODB1MzFCTE1FR0ZXaHNUQVFRdXJ6WGNJTUx5WHY2MTRGVTlH?=
 =?utf-8?B?Y0NiTksyaTZQNUdNVENaaG8wOFh5b2FHVXdaczhMVk5PaVVTbU8yd0JxWDRH?=
 =?utf-8?B?RE9LcVlhTkkvejJKdGNlMDBmTm94MUx2WmJlVjNPY3ErTHBBaUdDR2xQY2cz?=
 =?utf-8?B?UEFncGdyRENwb1plRnBudXZhR0VzWmRqaDVrNzZaWGtMeGNLTzc1YWtJRml2?=
 =?utf-8?B?ZU11RVdHVXVVQVdIcXlKMG9WcFhqNnFscGJKTUZmbjJFUjdSYWZIS1V6SlhB?=
 =?utf-8?B?RnVmeS9DRFB4aitYUVFSNjNwWi9WNFExRDdrTHFqbnVsdFI0UjhnbVFTOEYr?=
 =?utf-8?B?dWFzdVNJeEVLZ04vZjJZUDFDcElkUmR1MVJ3Y3FmYSsrRU1KZVJKYmZBVXUx?=
 =?utf-8?B?cTJ2WCs3QmhYMzF2alE2RThPdXp2dU5HdVBGMmhzVzFubXNvNkJIUTZ3Zi8z?=
 =?utf-8?B?d2YwTEVESG9uZXJNbkFMcytXditIM1RRT0pkR3pRb3luNWRCakxocFlXditU?=
 =?utf-8?B?M0lhdHlOS3Z1eStkb045c1BBL1kxL25oNm13ZzZrOWl6c2JmK1NXUk9VRlBF?=
 =?utf-8?B?WUxHZ1p6SDJ1NG5FN1hlWk1xVEd4VnFGNTh6d0FqSnZyZ2NRTnh3dE1MVXc2?=
 =?utf-8?B?QXhYdW5oaVQ0emR2KzJQVEJQSXpHZTErU0NVUXdEcWdhamRtcUorQ045Vmx4?=
 =?utf-8?B?Rm9uWXJST284dG5aRUxsUDI0TzErZ0NieStsbHJsSnhZYjNQNEVnbkh2czB4?=
 =?utf-8?B?U3NzRXA1Zk1EeS84ajczT3VTWWpISmpvTW05RlFBa0J0M2txWmdqZEgrczQx?=
 =?utf-8?B?RzdSMGh3bjZ4MWZxQXVibmEwcVZtM2lzRjFCa2NSNWZDSTBHWEdzQ0d5bW9X?=
 =?utf-8?B?ZTAwbzVFdDJyYkVYYzNDaEtQMjhPSWRxSDd1S0t1NHdESGxCZk94eElmQzBM?=
 =?utf-8?B?Ny9sSWE5UCtHblFHQ1hsaTFUV0Z2WjRJaGFydTZZNDB4dXQva3VLVStlVUo5?=
 =?utf-8?B?VUpMTGVTdWVVVXB3d3RHR213bi9LNkZvaExyaDJYcG5IM2N5QlhvV28yT2xF?=
 =?utf-8?B?Q0IzYkN2VlQ5T1hWVHdnTEMvOS9DK2sxSlhuc2M5czFaRGNoaFNTQkxHUE1N?=
 =?utf-8?B?VndoaGhQdGNBOGdwMnZWYytyc3lWbXdjTlBSMkQwSm9ORU5scHZqTGVKSXg4?=
 =?utf-8?B?ZmhrUDlkMFpNU3JqTnRvSGdCME4zUzN1YkRSQU5HRFdkUjRmV0dYZG00UGEv?=
 =?utf-8?B?YzIvZE1sMVFTZDZNVm5LUWlTOVpTa2VHeU9xNmtIM3lhVVRNZHhjd3VNVERS?=
 =?utf-8?B?Y25IUjZHZlI4QTFSMkFLODlvWG83Z3lkS00wQjNRck44UWpIVmlmeEhpY2FB?=
 =?utf-8?Q?onrCQwhR+/IDwhukpellqbemN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c94460-c686-465f-06c3-08daf581f6c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:19:37.0377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEIF/0iUXjTE4tu6S5pKVn2NP7nFQ3T4WREl41lqD2SWMg2SzsBZAgKuA1nAHX8aPfagGjrZpwWsCJEKwzajVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 stanislav.lisovskiy@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 bskeggs@redhat.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, mario.limonciello@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On 1/13/23 05:25, Daniel Vetter wrote:
> On Fri, Jan 13, 2023 at 12:16:57PM +0200, Jani Nikula wrote:
>>
>> Cc: intel-gfx, drm maintainers
>>
>> Please have the courtesy of Cc'ing us for changes impacting us, and
>> maybe try to involve us earlier instead of surprising us like
>> this. Looks like this has been debugged for at least three months, and
>> the huge revert at this point is going to set us back with what's been
>> developed on top of it for i915 DP MST and DSC.
> 
> tbf I assumed this wont land when I've seen it fly by. It feels a bit much
> like living under a rock for half a year and then creating a mess for
> everyone else who's been building on top of this is not great.
> 
> Like yes it's a regression, but apparently not a blantantly obvious one,
> and I think if we just ram this in there's considerable community goodwill
> down the drain. Someone needs to get that goodwill up the drain again.
> 
>> It's a regression, I get that, but this is also going to be really nasty
>> to deal with. It's a 2500-line commit, plus the dependencies, which I
>> don't think are accounted for here. (What's the baseline for the revert
>> anyway?) I don't expect all the dependent commits to be easy to revert
>> or backport to v6.1 or v6.2.
>>
>> *sad trombone*
> 
> Yeah that's the other thing. 2500 patch revert is not cc stable material.
> So this isn't even really helping users all that much.
> 
> Unless it also comes with full amounts of backports of the reverts on all
> affected drivers for all curent stable trees, fully validated.
> 
> This is bad. I do think we need to have some understanding first of what
> "fix this in amdgpu" would look like as plan B. Because plan A does not
> look like a happy one at all.

Agree with your sentiments and apologies for not making this visible to
you sooner. This has been on the corner of my radar but I should've given
it a higher priority and more visibility sooner.

Has anyone looked at the dependencies? I assume there are a number of
dependent commits that would be hard/impossible to untangle but haven't had
a chance to look for those myself. Could you highlight a couple?

Harry

> -Daniel
> 
>> BR,
>> Jani.
>>
>>
>> On Thu, 12 Jan 2023, Wayne Lin <Wayne.Lin@amd.com> wrote:
>>> This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
>>>
>>> [Why]
>>> Changes cause regression on amdgpu mst.
>>> E.g.
>>> In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove payload
>>> one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
>>> maintained payload table. But previous change tries to go through all the
>>> payloads in mst_state and update amdpug hw maintained table in once everytime
>>> driver only tries to add/remove a specific payload stream only. The newly
>>> design idea conflicts with the implementation in amdgpu nowadays.
>>>
>>> [How]
>>> Revert this patch first. After addressing all regression problems caused by
>>> this previous patch, will add it back and adjust it.
>>>
>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
>>> Cc: stable@vger.kernel.org # 6.1
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Ben Skeggs <bskeggs@redhat.com>
>>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
>>> ---
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  53 +-
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 106 ++-
>>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  87 ++-
>>>  .../amd/display/include/link_service_types.h  |   3 -
>>>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 724 ++++++++++++------
>>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  67 +-
>>>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  24 +-
>>>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 167 ++--
>>>  include/drm/display/drm_dp_mst_helper.h       | 177 +++--
>>>  9 files changed, 878 insertions(+), 530 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 77277d90b6e2..674f5dc1102b 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -6548,7 +6548,6 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
>>>  	const struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>>>  	struct drm_dp_mst_topology_mgr *mst_mgr;
>>>  	struct drm_dp_mst_port *mst_port;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>>  	enum dc_color_depth color_depth;
>>>  	int clock, bpp = 0;
>>>  	bool is_y420 = false;
>>> @@ -6562,13 +6561,6 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
>>>  	if (!crtc_state->connectors_changed && !crtc_state->mode_changed)
>>>  		return 0;
>>>  
>>> -	mst_state = drm_atomic_get_mst_topology_state(state, mst_mgr);
>>> -	if (IS_ERR(mst_state))
>>> -		return PTR_ERR(mst_state);
>>> -
>>> -	if (!mst_state->pbn_div)
>>> -		mst_state->pbn_div = dm_mst_get_pbn_divider(aconnector->mst_port->dc_link);
>>> -
>>>  	if (!state->duplicated) {
>>>  		int max_bpc = conn_state->max_requested_bpc;
>>>  		is_y420 = drm_mode_is_420_also(&connector->display_info, adjusted_mode) &&
>>> @@ -6580,10 +6572,11 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
>>>  		clock = adjusted_mode->clock;
>>>  		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp, false);
>>>  	}
>>> -
>>> -	dm_new_connector_state->vcpi_slots =
>>> -		drm_dp_atomic_find_time_slots(state, mst_mgr, mst_port,
>>> -					      dm_new_connector_state->pbn);
>>> +	dm_new_connector_state->vcpi_slots = drm_dp_atomic_find_time_slots(state,
>>> +									   mst_mgr,
>>> +									   mst_port,
>>> +									   dm_new_connector_state->pbn,
>>> +									   dm_mst_get_pbn_divider(aconnector->dc_link));
>>>  	if (dm_new_connector_state->vcpi_slots < 0) {
>>>  		DRM_DEBUG_ATOMIC("failed finding vcpi slots: %d\n", (int)dm_new_connector_state->vcpi_slots);
>>>  		return dm_new_connector_state->vcpi_slots;
>>> @@ -6654,14 +6647,17 @@ static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
>>>  			dm_conn_state->vcpi_slots = slot_num;
>>>  
>>>  			ret = drm_dp_mst_atomic_enable_dsc(state, aconnector->port,
>>> -							   dm_conn_state->pbn, false);
>>> +							   dm_conn_state->pbn, 0, false);
>>>  			if (ret < 0)
>>>  				return ret;
>>>  
>>>  			continue;
>>>  		}
>>>  
>>> -		vcpi = drm_dp_mst_atomic_enable_dsc(state, aconnector->port, pbn, true);
>>> +		vcpi = drm_dp_mst_atomic_enable_dsc(state,
>>> +						    aconnector->port,
>>> +						    pbn, pbn_div,
>>> +						    true);
>>>  		if (vcpi < 0)
>>>  			return vcpi;
>>>  
>>> @@ -9497,6 +9493,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>>  	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>>>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>>>  	struct dsc_mst_fairness_vars vars[MAX_PIPES];
>>> +	struct drm_dp_mst_topology_state *mst_state;
>>> +	struct drm_dp_mst_topology_mgr *mgr;
>>>  #endif
>>>  
>>>  	trace_amdgpu_dm_atomic_check_begin(state);
>>> @@ -9744,6 +9742,33 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>>  		lock_and_validation_needed = true;
>>>  	}
>>>  
>>> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>>> +	/* set the slot info for each mst_state based on the link encoding format */
>>> +	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>>> +		struct amdgpu_dm_connector *aconnector;
>>> +		struct drm_connector *connector;
>>> +		struct drm_connector_list_iter iter;
>>> +		u8 link_coding_cap;
>>> +
>>> +		if (!mgr->mst_state )
>>> +			continue;
>>> +
>>> +		drm_connector_list_iter_begin(dev, &iter);
>>> +		drm_for_each_connector_iter(connector, &iter) {
>>> +			int id = connector->index;
>>> +
>>> +			if (id == mst_state->mgr->conn_base_id) {
>>> +				aconnector = to_amdgpu_dm_connector(connector);
>>> +				link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
>>> +				drm_dp_mst_update_slots(mst_state, link_coding_cap);
>>> +
>>> +				break;
>>> +			}
>>> +		}
>>> +		drm_connector_list_iter_end(&iter);
>>> +
>>> +	}
>>> +#endif
>>>  	/**
>>>  	 * Streams and planes are reset when there are changes that affect
>>>  	 * bandwidth. Anything that affects bandwidth needs to go through
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index 6994c9a1ed85..ac5a8cad0695 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -27,7 +27,6 @@
>>>  #include <linux/acpi.h>
>>>  #include <linux/i2c.h>
>>>  
>>> -#include <drm/drm_atomic.h>
>>>  #include <drm/drm_probe_helper.h>
>>>  #include <drm/amdgpu_drm.h>
>>>  #include <drm/drm_edid.h>
>>> @@ -120,27 +119,40 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>>>  }
>>>  
>>>  static void
>>> -fill_dc_mst_payload_table_from_drm(struct drm_dp_mst_topology_state *mst_state,
>>> -				   struct amdgpu_dm_connector *aconnector,
>>> -				   struct dc_dp_mst_stream_allocation_table *table)
>>> -{
>>> -	struct dc_dp_mst_stream_allocation_table new_table = { 0 };
>>> -	struct dc_dp_mst_stream_allocation *sa;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> -
>>> -	/* Fill payload info*/
>>> -	list_for_each_entry(payload, &mst_state->payloads, next) {
>>> -		if (payload->delete)
>>> -			continue;
>>> -
>>> -		sa = &new_table.stream_allocations[new_table.stream_count];
>>> -		sa->slot_count = payload->time_slots;
>>> -		sa->vcp_id = payload->vcpi;
>>> -		new_table.stream_count++;
>>> +fill_dc_mst_payload_table_from_drm(struct amdgpu_dm_connector *aconnector,
>>> +				   struct dc_dp_mst_stream_allocation_table *proposed_table)
>>> +{
>>> +	int i;
>>> +	struct drm_dp_mst_topology_mgr *mst_mgr =
>>> +			&aconnector->mst_port->mst_mgr;
>>> +
>>> +	mutex_lock(&mst_mgr->payload_lock);
>>> +
>>> +	proposed_table->stream_count = 0;
>>> +
>>> +	/* number of active streams */
>>> +	for (i = 0; i < mst_mgr->max_payloads; i++) {
>>> +		if (mst_mgr->payloads[i].num_slots == 0)
>>> +			break; /* end of vcp_id table */
>>> +
>>> +		ASSERT(mst_mgr->payloads[i].payload_state !=
>>> +				DP_PAYLOAD_DELETE_LOCAL);
>>> +
>>> +		if (mst_mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL ||
>>> +			mst_mgr->payloads[i].payload_state ==
>>> +					DP_PAYLOAD_REMOTE) {
>>> +
>>> +			struct dc_dp_mst_stream_allocation *sa =
>>> +					&proposed_table->stream_allocations[
>>> +						proposed_table->stream_count];
>>> +
>>> +			sa->slot_count = mst_mgr->payloads[i].num_slots;
>>> +			sa->vcp_id = mst_mgr->proposed_vcpis[i]->vcpi;
>>> +			proposed_table->stream_count++;
>>> +		}
>>>  	}
>>>  
>>> -	/* Overwrite the old table */
>>> -	*table = new_table;
>>> +	mutex_unlock(&mst_mgr->payload_lock);
>>>  }
>>>  
>>>  void dm_helpers_dp_update_branch_info(
>>> @@ -158,9 +170,11 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>>>  		bool enable)
>>>  {
>>>  	struct amdgpu_dm_connector *aconnector;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> +	struct dm_connector_state *dm_conn_state;
>>>  	struct drm_dp_mst_topology_mgr *mst_mgr;
>>> +	struct drm_dp_mst_port *mst_port;
>>> +	bool ret;
>>> +	u8 link_coding_cap = DP_8b_10b_ENCODING;
>>>  
>>>  	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
>>>  	/* Accessing the connector state is required for vcpi_slots allocation
>>> @@ -171,21 +185,40 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>>>  	if (!aconnector || !aconnector->mst_port)
>>>  		return false;
>>>  
>>> +	dm_conn_state = to_dm_connector_state(aconnector->base.state);
>>> +
>>>  	mst_mgr = &aconnector->mst_port->mst_mgr;
>>> -	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
>>> +
>>> +	if (!mst_mgr->mst_state)
>>> +		return false;
>>> +
>>> +	mst_port = aconnector->port;
>>> +
>>> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>>> +	link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
>>> +#endif
>>> +
>>> +	if (enable) {
>>> +
>>> +		ret = drm_dp_mst_allocate_vcpi(mst_mgr, mst_port,
>>> +					       dm_conn_state->pbn,
>>> +					       dm_conn_state->vcpi_slots);
>>> +		if (!ret)
>>> +			return false;
>>> +
>>> +	} else {
>>> +		drm_dp_mst_reset_vcpi_slots(mst_mgr, mst_port);
>>> +	}
>>>  
>>>  	/* It's OK for this to fail */
>>> -	payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->port);
>>> -	if (enable)
>>> -		drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
>>> -	else
>>> -		drm_dp_remove_payload(mst_mgr, mst_state, payload);
>>> +	drm_dp_update_payload_part1(mst_mgr, (link_coding_cap == DP_CAP_ANSI_128B132B) ? 0:1);
>>>  
>>>  	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
>>>  	 * AUX message. The sequence is slot 1-63 allocated sequence for each
>>>  	 * stream. AMD ASIC stream slot allocation should follow the same
>>>  	 * sequence. copy DRM MST allocation to dc */
>>> -	fill_dc_mst_payload_table_from_drm(mst_state, aconnector, proposed_table);
>>> +
>>> +	fill_dc_mst_payload_table_from_drm(aconnector, proposed_table);
>>>  
>>>  	return true;
>>>  }
>>> @@ -242,9 +275,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>  		bool enable)
>>>  {
>>>  	struct amdgpu_dm_connector *aconnector;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>>  	struct drm_dp_mst_topology_mgr *mst_mgr;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> +	struct drm_dp_mst_port *mst_port;
>>>  	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
>>>  	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>>>  
>>> @@ -253,16 +285,19 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>  	if (!aconnector || !aconnector->mst_port)
>>>  		return false;
>>>  
>>> +	mst_port = aconnector->port;
>>> +
>>>  	mst_mgr = &aconnector->mst_port->mst_mgr;
>>> -	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
>>>  
>>> -	payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->port);
>>> +	if (!mst_mgr->mst_state)
>>> +		return false;
>>> +
>>>  	if (!enable) {
>>>  		set_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>>>  		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
>>>  	}
>>>  
>>> -	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload)) {
>>> +	if (drm_dp_update_payload_part2(mst_mgr)) {
>>>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>>>  			set_flag, false);
>>>  	} else {
>>> @@ -272,6 +307,9 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>>>  			clr_flag, false);
>>>  	}
>>>  
>>> +	if (!enable)
>>> +		drm_dp_mst_deallocate_vcpi(mst_mgr, mst_port);
>>> +
>>>  	return true;
>>>  }
>>>  
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> index 1edf7385f8d8..6207026a200f 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>>> @@ -598,8 +598,15 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>>  
>>>  	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>>>  	aconnector->mst_mgr.cbs = &dm_mst_cbs;
>>> -	drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->adev),
>>> -				     &aconnector->dm_dp_aux.aux, 16, 4, aconnector->connector_id);
>>> +	drm_dp_mst_topology_mgr_init(
>>> +		&aconnector->mst_mgr,
>>> +		adev_to_drm(dm->adev),
>>> +		&aconnector->dm_dp_aux.aux,
>>> +		16,
>>> +		4,
>>> +		max_link_enc_cap.lane_count,
>>> +		drm_dp_bw_code_to_link_rate(max_link_enc_cap.link_rate),
>>> +		aconnector->connector_id);
>>>  
>>>  	drm_connector_attach_dp_subconnector_property(&aconnector->base);
>>>  }
>>> @@ -710,13 +717,12 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
>>>  	return dsc_config.bits_per_pixel;
>>>  }
>>>  
>>> -static int increase_dsc_bpp(struct drm_atomic_state *state,
>>> -			    struct drm_dp_mst_topology_state *mst_state,
>>> -			    struct dc_link *dc_link,
>>> -			    struct dsc_mst_fairness_params *params,
>>> -			    struct dsc_mst_fairness_vars *vars,
>>> -			    int count,
>>> -			    int k)
>>> +static bool increase_dsc_bpp(struct drm_atomic_state *state,
>>> +			     struct dc_link *dc_link,
>>> +			     struct dsc_mst_fairness_params *params,
>>> +			     struct dsc_mst_fairness_vars *vars,
>>> +			     int count,
>>> +			     int k)
>>>  {
>>>  	int i;
>>>  	bool bpp_increased[MAX_PIPES];
>>> @@ -724,10 +730,13 @@ static int increase_dsc_bpp(struct drm_atomic_state *state,
>>>  	int min_initial_slack;
>>>  	int next_index;
>>>  	int remaining_to_increase = 0;
>>> +	int pbn_per_timeslot;
>>>  	int link_timeslots_used;
>>>  	int fair_pbn_alloc;
>>>  	int ret = 0;
>>>  
>>> +	pbn_per_timeslot = dm_mst_get_pbn_divider(dc_link);
>>> +
>>>  	for (i = 0; i < count; i++) {
>>>  		if (vars[i + k].dsc_enabled) {
>>>  			initial_slack[i] =
>>> @@ -758,17 +767,18 @@ static int increase_dsc_bpp(struct drm_atomic_state *state,
>>>  		link_timeslots_used = 0;
>>>  
>>>  		for (i = 0; i < count; i++)
>>> -			link_timeslots_used += DIV_ROUND_UP(vars[i + k].pbn, mst_state->pbn_div);
>>> +			link_timeslots_used += DIV_ROUND_UP(vars[i + k].pbn, pbn_per_timeslot);
>>>  
>>> -		fair_pbn_alloc =
>>> -			(63 - link_timeslots_used) / remaining_to_increase * mst_state->pbn_div;
>>> +		fair_pbn_alloc = (63 - link_timeslots_used) / remaining_to_increase * pbn_per_timeslot;
>>>  
>>>  		if (initial_slack[next_index] > fair_pbn_alloc) {
>>>  			vars[next_index].pbn += fair_pbn_alloc;
>>> +
>>>  			ret = drm_dp_atomic_find_time_slots(state,
>>>  							    params[next_index].port->mgr,
>>>  							    params[next_index].port,
>>> -							    vars[next_index].pbn);
>>> +							    vars[next_index].pbn,
>>> +							    pbn_per_timeslot);
>>>  			if (ret < 0)
>>>  				return ret;
>>>  
>>> @@ -780,7 +790,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *state,
>>>  				ret = drm_dp_atomic_find_time_slots(state,
>>>  								    params[next_index].port->mgr,
>>>  								    params[next_index].port,
>>> -								    vars[next_index].pbn);
>>> +								    vars[next_index].pbn,
>>> +								    pbn_per_timeslot);
>>>  				if (ret < 0)
>>>  					return ret;
>>>  			}
>>> @@ -789,7 +800,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *state,
>>>  			ret = drm_dp_atomic_find_time_slots(state,
>>>  							    params[next_index].port->mgr,
>>>  							    params[next_index].port,
>>> -							    vars[next_index].pbn);
>>> +							    vars[next_index].pbn,
>>> +							    pbn_per_timeslot);
>>>  			if (ret < 0)
>>>  				return ret;
>>>  
>>> @@ -801,7 +813,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *state,
>>>  				ret = drm_dp_atomic_find_time_slots(state,
>>>  								    params[next_index].port->mgr,
>>>  								    params[next_index].port,
>>> -								    vars[next_index].pbn);
>>> +								    vars[next_index].pbn,
>>> +								    pbn_per_timeslot);
>>>  				if (ret < 0)
>>>  					return ret;
>>>  			}
>>> @@ -857,10 +870,12 @@ static int try_disable_dsc(struct drm_atomic_state *state,
>>>  			break;
>>>  
>>>  		vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps);
>>> +
>>>  		ret = drm_dp_atomic_find_time_slots(state,
>>>  						    params[next_index].port->mgr,
>>>  						    params[next_index].port,
>>> -						    vars[next_index].pbn);
>>> +						    vars[next_index].pbn,
>>> +						    dm_mst_get_pbn_divider(dc_link));
>>>  		if (ret < 0)
>>>  			return ret;
>>>  
>>> @@ -870,10 +885,12 @@ static int try_disable_dsc(struct drm_atomic_state *state,
>>>  			vars[next_index].bpp_x16 = 0;
>>>  		} else {
>>>  			vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.max_kbps);
>>> +
>>>  			ret = drm_dp_atomic_find_time_slots(state,
>>>  							    params[next_index].port->mgr,
>>>  							    params[next_index].port,
>>> -							    vars[next_index].pbn);
>>> +							    vars[next_index].pbn,
>>> +							    dm_mst_get_pbn_divider(dc_link));
>>>  			if (ret < 0)
>>>  				return ret;
>>>  		}
>>> @@ -884,31 +901,21 @@ static int try_disable_dsc(struct drm_atomic_state *state,
>>>  	return 0;
>>>  }
>>>  
>>> -static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>> -					    struct dc_state *dc_state,
>>> -					    struct dc_link *dc_link,
>>> -					    struct dsc_mst_fairness_vars *vars,
>>> -					    struct drm_dp_mst_topology_mgr *mgr,
>>> -					    int *link_vars_start_index)
>>> +static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>> +					     struct dc_state *dc_state,
>>> +					     struct dc_link *dc_link,
>>> +					     struct dsc_mst_fairness_vars *vars,
>>> +					     int *link_vars_start_index)
>>>  {
>>> +	int i, k, ret;
>>>  	struct dc_stream_state *stream;
>>>  	struct dsc_mst_fairness_params params[MAX_PIPES];
>>>  	struct amdgpu_dm_connector *aconnector;
>>> -	struct drm_dp_mst_topology_state *mst_state = drm_atomic_get_mst_topology_state(state, mgr);
>>>  	int count = 0;
>>> -	int i, k, ret;
>>>  	bool debugfs_overwrite = false;
>>>  
>>>  	memset(params, 0, sizeof(params));
>>>  
>>> -	if (IS_ERR(mst_state))
>>> -		return PTR_ERR(mst_state);
>>> -
>>> -	mst_state->pbn_div = dm_mst_get_pbn_divider(dc_link);
>>> -#if defined(CONFIG_DRM_AMD_DC_DCN)
>>> -	drm_dp_mst_update_slots(mst_state, dc_link_dp_mst_decide_link_encoding_format(dc_link));
>>> -#endif
>>> -
>>>  	/* Set up params */
>>>  	for (i = 0; i < dc_state->stream_count; i++) {
>>>  		struct dc_dsc_policy dsc_policy = {0};
>>> @@ -968,7 +975,7 @@ static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>>  		vars[i + k].dsc_enabled = false;
>>>  		vars[i + k].bpp_x16 = 0;
>>>  		ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr, params[i].port,
>>> -						    vars[i + k].pbn);
>>> +						    vars[i + k].pbn, dm_mst_get_pbn_divider(dc_link));
>>>  		if (ret < 0)
>>>  			return ret;
>>>  	}
>>> @@ -987,7 +994,7 @@ static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>>  			vars[i + k].dsc_enabled = true;
>>>  			vars[i + k].bpp_x16 = params[i].bw_range.min_target_bpp_x16;
>>>  			ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr,
>>> -							    params[i].port, vars[i + k].pbn);
>>> +							    params[i].port, vars[i + k].pbn, dm_mst_get_pbn_divider(dc_link));
>>>  			if (ret < 0)
>>>  				return ret;
>>>  		} else {
>>> @@ -995,7 +1002,7 @@ static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>>  			vars[i + k].dsc_enabled = false;
>>>  			vars[i + k].bpp_x16 = 0;
>>>  			ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr,
>>> -							    params[i].port, vars[i + k].pbn);
>>> +							    params[i].port, vars[i + k].pbn, dm_mst_get_pbn_divider(dc_link));
>>>  			if (ret < 0)
>>>  				return ret;
>>>  		}
>>> @@ -1005,7 +1012,7 @@ static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
>>>  		return ret;
>>>  
>>>  	/* Optimize degree of compression */
>>> -	ret = increase_dsc_bpp(state, mst_state, dc_link, params, vars, count, k);
>>> +	ret = increase_dsc_bpp(state, dc_link, params, vars, count, k);
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>> @@ -1155,7 +1162,7 @@ int compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
>>>  			continue;
>>>  
>>>  		mst_mgr = aconnector->port->mgr;
>>> -		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars, mst_mgr,
>>> +		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars,
>>>  						       &link_vars_start_index);
>>>  		if (ret != 0)
>>>  			return ret;
>>> @@ -1213,7 +1220,7 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
>>>  			continue;
>>>  
>>>  		mst_mgr = aconnector->port->mgr;
>>> -		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars, mst_mgr,
>>> +		ret = compute_mst_dsc_configs_for_link(state, dc_state, stream->link, vars,
>>>  						       &link_vars_start_index);
>>>  		if (ret != 0)
>>>  			return ret;
>>> diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/drivers/gpu/drm/amd/display/include/link_service_types.h
>>> index d1e91d31d151..0889c2a86733 100644
>>> --- a/drivers/gpu/drm/amd/display/include/link_service_types.h
>>> +++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
>>> @@ -252,9 +252,6 @@ union dpcd_training_lane_set {
>>>   * _ONLY_ be filled out from DM and then passed to DC, do NOT use these for _any_ kind of atomic
>>>   * state calculations in DM, or you will break something.
>>>   */
>>> -
>>> -struct drm_dp_mst_port;
>>> -
>>>  /* DP MST stream allocation (payload bandwidth number) */
>>>  struct dc_dp_mst_stream_allocation {
>>>  	uint8_t vcp_id;
>>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> index 51a46689cda7..95ff57d20216 100644
>>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> @@ -68,7 +68,8 @@ static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
>>>  static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
>>>  
>>>  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>>> -				     int id, u8 start_slot, u8 num_slots);
>>> +				     int id,
>>> +				     struct drm_dp_payload *payload);
>>>  
>>>  static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>>>  				 struct drm_dp_mst_port *port,
>>> @@ -1234,6 +1235,57 @@ build_query_stream_enc_status(struct drm_dp_sideband_msg_tx *msg, u8 stream_id,
>>>  	return 0;
>>>  }
>>>  
>>> +static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *mgr,
>>> +					struct drm_dp_vcpi *vcpi)
>>> +{
>>> +	int ret, vcpi_ret;
>>> +
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	ret = find_first_zero_bit(&mgr->payload_mask, mgr->max_payloads + 1);
>>> +	if (ret > mgr->max_payloads) {
>>> +		ret = -EINVAL;
>>> +		drm_dbg_kms(mgr->dev, "out of payload ids %d\n", ret);
>>> +		goto out_unlock;
>>> +	}
>>> +
>>> +	vcpi_ret = find_first_zero_bit(&mgr->vcpi_mask, mgr->max_payloads + 1);
>>> +	if (vcpi_ret > mgr->max_payloads) {
>>> +		ret = -EINVAL;
>>> +		drm_dbg_kms(mgr->dev, "out of vcpi ids %d\n", ret);
>>> +		goto out_unlock;
>>> +	}
>>> +
>>> +	set_bit(ret, &mgr->payload_mask);
>>> +	set_bit(vcpi_ret, &mgr->vcpi_mask);
>>> +	vcpi->vcpi = vcpi_ret + 1;
>>> +	mgr->proposed_vcpis[ret - 1] = vcpi;
>>> +out_unlock:
>>> +	mutex_unlock(&mgr->payload_lock);
>>> +	return ret;
>>> +}
>>> +
>>> +static void drm_dp_mst_put_payload_id(struct drm_dp_mst_topology_mgr *mgr,
>>> +				      int vcpi)
>>> +{
>>> +	int i;
>>> +
>>> +	if (vcpi == 0)
>>> +		return;
>>> +
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	drm_dbg_kms(mgr->dev, "putting payload %d\n", vcpi);
>>> +	clear_bit(vcpi - 1, &mgr->vcpi_mask);
>>> +
>>> +	for (i = 0; i < mgr->max_payloads; i++) {
>>> +		if (mgr->proposed_vcpis[i] &&
>>> +		    mgr->proposed_vcpis[i]->vcpi == vcpi) {
>>> +			mgr->proposed_vcpis[i] = NULL;
>>> +			clear_bit(i + 1, &mgr->payload_mask);
>>> +		}
>>> +	}
>>> +	mutex_unlock(&mgr->payload_lock);
>>> +}
>>> +
>>>  static bool check_txmsg_state(struct drm_dp_mst_topology_mgr *mgr,
>>>  			      struct drm_dp_sideband_msg_tx *txmsg)
>>>  {
>>> @@ -1686,7 +1738,7 @@ drm_dp_mst_dump_port_topology_history(struct drm_dp_mst_port *port) {}
>>>  #define save_port_topology_ref(port, type)
>>>  #endif
>>>  
>>> -struct drm_dp_mst_atomic_payload *
>>> +static struct drm_dp_mst_atomic_payload *
>>>  drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
>>>  				 struct drm_dp_mst_port *port)
>>>  {
>>> @@ -1698,7 +1750,6 @@ drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
>>>  
>>>  	return NULL;
>>>  }
>>> -EXPORT_SYMBOL(drm_atomic_get_mst_payload_state);
>>>  
>>>  static void drm_dp_destroy_mst_branch_device(struct kref *kref)
>>>  {
>>> @@ -3201,8 +3252,6 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
>>>  		struct drm_dp_mst_port *port,
>>>  		struct drm_dp_query_stream_enc_status_ack_reply *status)
>>>  {
>>> -	struct drm_dp_mst_topology_state *state;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>>  	struct drm_dp_sideband_msg_tx *txmsg;
>>>  	u8 nonce[7];
>>>  	int ret;
>>> @@ -3219,10 +3268,6 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
>>>  
>>>  	get_random_bytes(nonce, sizeof(nonce));
>>>  
>>> -	drm_modeset_lock(&mgr->base.lock, NULL);
>>> -	state = to_drm_dp_mst_topology_state(mgr->base.state);
>>> -	payload = drm_atomic_get_mst_payload_state(state, port);
>>> -
>>>  	/*
>>>  	 * "Source device targets the QUERY_STREAM_ENCRYPTION_STATUS message
>>>  	 *  transaction at the MST Branch device directly connected to the
>>> @@ -3230,7 +3275,7 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
>>>  	 */
>>>  	txmsg->dst = mgr->mst_primary;
>>>  
>>> -	build_query_stream_enc_status(txmsg, payload->vcpi, nonce);
>>> +	build_query_stream_enc_status(txmsg, port->vcpi.vcpi, nonce);
>>>  
>>>  	drm_dp_queue_down_tx(mgr, txmsg);
>>>  
>>> @@ -3247,7 +3292,6 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
>>>  	memcpy(status, &txmsg->reply.u.enc_status, sizeof(*status));
>>>  
>>>  out:
>>> -	drm_modeset_unlock(&mgr->base.lock);
>>>  	drm_dp_mst_topology_put_port(port);
>>>  out_get_port:
>>>  	kfree(txmsg);
>>> @@ -3256,162 +3300,238 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
>>>  EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
>>>  
>>>  static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
>>> -				       struct drm_dp_mst_atomic_payload *payload)
>>> +				       int id,
>>> +				       struct drm_dp_payload *payload)
>>>  {
>>> -	return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,
>>> -					 payload->time_slots);
>>> +	int ret;
>>> +
>>> +	ret = drm_dp_dpcd_write_payload(mgr, id, payload);
>>> +	if (ret < 0) {
>>> +		payload->payload_state = 0;
>>> +		return ret;
>>> +	}
>>> +	payload->payload_state = DP_PAYLOAD_LOCAL;
>>> +	return 0;
>>>  }
>>>  
>>>  static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
>>> -				       struct drm_dp_mst_atomic_payload *payload)
>>> +				       struct drm_dp_mst_port *port,
>>> +				       int id,
>>> +				       struct drm_dp_payload *payload)
>>>  {
>>>  	int ret;
>>> -	struct drm_dp_mst_port *port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
>>> -
>>> -	if (!port)
>>> -		return -EIO;
>>>  
>>> -	ret = drm_dp_payload_send_msg(mgr, port, payload->vcpi, payload->pbn);
>>> -	drm_dp_mst_topology_put_port(port);
>>> +	ret = drm_dp_payload_send_msg(mgr, port, id, port->vcpi.pbn);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	payload->payload_state = DP_PAYLOAD_REMOTE;
>>>  	return ret;
>>>  }
>>>  
>>>  static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
>>> -					struct drm_dp_mst_topology_state *mst_state,
>>> -					struct drm_dp_mst_atomic_payload *payload)
>>> +					struct drm_dp_mst_port *port,
>>> +					int id,
>>> +					struct drm_dp_payload *payload)
>>>  {
>>>  	drm_dbg_kms(mgr->dev, "\n");
>>> -
>>>  	/* it's okay for these to fail */
>>> -	drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
>>> -	drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot, 0);
>>> +	if (port) {
>>> +		drm_dp_payload_send_msg(mgr, port, id, 0);
>>> +	}
>>>  
>>> +	drm_dp_dpcd_write_payload(mgr, id, payload);
>>> +	payload->payload_state = DP_PAYLOAD_DELETE_LOCAL;
>>> +	return 0;
>>> +}
>>> +
>>> +static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
>>> +					int id,
>>> +					struct drm_dp_payload *payload)
>>> +{
>>> +	payload->payload_state = 0;
>>>  	return 0;
>>>  }
>>>  
>>>  /**
>>> - * drm_dp_add_payload_part1() - Execute payload update part 1
>>> - * @mgr: Manager to use.
>>> - * @mst_state: The MST atomic state
>>> - * @payload: The payload to write
>>> + * drm_dp_update_payload_part1() - Execute payload update part 1
>>> + * @mgr: manager to use.
>>> + * @start_slot: this is the cur slot
>>> + *
>>> + * NOTE: start_slot is a temporary workaround for non-atomic drivers,
>>> + * this will be removed when non-atomic mst helpers are moved out of the helper
>>>   *
>>> - * Determines the starting time slot for the given payload, and programs the VCPI for this payload
>>> - * into hardware. After calling this, the driver should generate ACT and payload packets.
>>> + * This iterates over all proposed virtual channels, and tries to
>>> + * allocate space in the link for them. For 0->slots transitions,
>>> + * this step just writes the VCPI to the MST device. For slots->0
>>> + * transitions, this writes the updated VCPIs and removes the
>>> + * remote VC payloads.
>>>   *
>>> - * Returns: 0 on success, error code on failure. In the event that this fails,
>>> - * @payload.vc_start_slot will also be set to -1.
>>> + * after calling this the driver should generate ACT and payload
>>> + * packets.
>>>   */
>>> -int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_dp_mst_topology_state *mst_state,
>>> -			     struct drm_dp_mst_atomic_payload *payload)
>>> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot)
>>>  {
>>> +	struct drm_dp_payload req_payload;
>>>  	struct drm_dp_mst_port *port;
>>> -	int ret;
>>> +	int i, j;
>>> +	int cur_slots = start_slot;
>>> +	bool skip;
>>>  
>>> -	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
>>> -	if (!port)
>>> -		return 0;
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	for (i = 0; i < mgr->max_payloads; i++) {
>>> +		struct drm_dp_vcpi *vcpi = mgr->proposed_vcpis[i];
>>> +		struct drm_dp_payload *payload = &mgr->payloads[i];
>>> +		bool put_port = false;
>>>  
>>> -	if (mgr->payload_count == 0)
>>> -		mgr->next_start_slot = mst_state->start_slot;
>>> +		/* solve the current payloads - compare to the hw ones
>>> +		   - update the hw view */
>>> +		req_payload.start_slot = cur_slots;
>>> +		if (vcpi) {
>>> +			port = container_of(vcpi, struct drm_dp_mst_port,
>>> +					    vcpi);
>>>  
>>> -	payload->vc_start_slot = mgr->next_start_slot;
>>> +			mutex_lock(&mgr->lock);
>>> +			skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
>>> +			mutex_unlock(&mgr->lock);
>>>  
>>> -	ret = drm_dp_create_payload_step1(mgr, payload);
>>> -	drm_dp_mst_topology_put_port(port);
>>> -	if (ret < 0) {
>>> -		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
>>> -			 payload->port, ret);
>>> -		payload->vc_start_slot = -1;
>>> -		return ret;
>>> -	}
>>> +			if (skip) {
>>> +				drm_dbg_kms(mgr->dev,
>>> +					    "Virtual channel %d is not in current topology\n",
>>> +					    i);
>>> +				continue;
>>> +			}
>>> +			/* Validated ports don't matter if we're releasing
>>> +			 * VCPI
>>> +			 */
>>> +			if (vcpi->num_slots) {
>>> +				port = drm_dp_mst_topology_get_port_validated(
>>> +				    mgr, port);
>>> +				if (!port) {
>>> +					if (vcpi->num_slots == payload->num_slots) {
>>> +						cur_slots += vcpi->num_slots;
>>> +						payload->start_slot = req_payload.start_slot;
>>> +						continue;
>>> +					} else {
>>> +						drm_dbg_kms(mgr->dev,
>>> +							    "Fail:set payload to invalid sink");
>>> +						mutex_unlock(&mgr->payload_lock);
>>> +						return -EINVAL;
>>> +					}
>>> +				}
>>> +				put_port = true;
>>> +			}
>>>  
>>> -	mgr->payload_count++;
>>> -	mgr->next_start_slot += payload->time_slots;
>>> +			req_payload.num_slots = vcpi->num_slots;
>>> +			req_payload.vcpi = vcpi->vcpi;
>>> +		} else {
>>> +			port = NULL;
>>> +			req_payload.num_slots = 0;
>>> +		}
>>>  
>>> -	return 0;
>>> -}
>>> -EXPORT_SYMBOL(drm_dp_add_payload_part1);
>>> +		payload->start_slot = req_payload.start_slot;
>>> +		/* work out what is required to happen with this payload */
>>> +		if (payload->num_slots != req_payload.num_slots) {
>>> +
>>> +			/* need to push an update for this payload */
>>> +			if (req_payload.num_slots) {
>>> +				drm_dp_create_payload_step1(mgr, vcpi->vcpi,
>>> +							    &req_payload);
>>> +				payload->num_slots = req_payload.num_slots;
>>> +				payload->vcpi = req_payload.vcpi;
>>> +
>>> +			} else if (payload->num_slots) {
>>> +				payload->num_slots = 0;
>>> +				drm_dp_destroy_payload_step1(mgr, port,
>>> +							     payload->vcpi,
>>> +							     payload);
>>> +				req_payload.payload_state =
>>> +					payload->payload_state;
>>> +				payload->start_slot = 0;
>>> +			}
>>> +			payload->payload_state = req_payload.payload_state;
>>> +		}
>>> +		cur_slots += req_payload.num_slots;
>>>  
>>> -/**
>>> - * drm_dp_remove_payload() - Remove an MST payload
>>> - * @mgr: Manager to use.
>>> - * @mst_state: The MST atomic state
>>> - * @payload: The payload to write
>>> - *
>>> - * Removes a payload from an MST topology if it was successfully assigned a start slot. Also updates
>>> - * the starting time slots of all other payloads which would have been shifted towards the start of
>>> - * the VC table as a result. After calling this, the driver should generate ACT and payload packets.
>>> - */
>>> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
>>> -			   struct drm_dp_mst_topology_state *mst_state,
>>> -			   struct drm_dp_mst_atomic_payload *payload)
>>> -{
>>> -	struct drm_dp_mst_atomic_payload *pos;
>>> -	bool send_remove = false;
>>> +		if (put_port)
>>> +			drm_dp_mst_topology_put_port(port);
>>> +	}
>>>  
>>> -	/* We failed to make the payload, so nothing to do */
>>> -	if (payload->vc_start_slot == -1)
>>> -		return;
>>> +	for (i = 0; i < mgr->max_payloads; /* do nothing */) {
>>> +		if (mgr->payloads[i].payload_state != DP_PAYLOAD_DELETE_LOCAL) {
>>> +			i++;
>>> +			continue;
>>> +		}
>>>  
>>> -	mutex_lock(&mgr->lock);
>>> -	send_remove = drm_dp_mst_port_downstream_of_branch(payload->port, mgr->mst_primary);
>>> -	mutex_unlock(&mgr->lock);
>>> +		drm_dbg_kms(mgr->dev, "removing payload %d\n", i);
>>> +		for (j = i; j < mgr->max_payloads - 1; j++) {
>>> +			mgr->payloads[j] = mgr->payloads[j + 1];
>>> +			mgr->proposed_vcpis[j] = mgr->proposed_vcpis[j + 1];
>>>  
>>> -	if (send_remove)
>>> -		drm_dp_destroy_payload_step1(mgr, mst_state, payload);
>>> -	else
>>> -		drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not sending remove\n",
>>> -			    payload->vcpi);
>>> +			if (mgr->proposed_vcpis[j] &&
>>> +			    mgr->proposed_vcpis[j]->num_slots) {
>>> +				set_bit(j + 1, &mgr->payload_mask);
>>> +			} else {
>>> +				clear_bit(j + 1, &mgr->payload_mask);
>>> +			}
>>> +		}
>>>  
>>> -	list_for_each_entry(pos, &mst_state->payloads, next) {
>>> -		if (pos != payload && pos->vc_start_slot > payload->vc_start_slot)
>>> -			pos->vc_start_slot -= payload->time_slots;
>>> +		memset(&mgr->payloads[mgr->max_payloads - 1], 0,
>>> +		       sizeof(struct drm_dp_payload));
>>> +		mgr->proposed_vcpis[mgr->max_payloads - 1] = NULL;
>>> +		clear_bit(mgr->max_payloads, &mgr->payload_mask);
>>>  	}
>>> -	payload->vc_start_slot = -1;
>>> +	mutex_unlock(&mgr->payload_lock);
>>>  
>>> -	mgr->payload_count--;
>>> -	mgr->next_start_slot -= payload->time_slots;
>>> +	return 0;
>>>  }
>>> -EXPORT_SYMBOL(drm_dp_remove_payload);
>>> +EXPORT_SYMBOL(drm_dp_update_payload_part1);
>>>  
>>>  /**
>>> - * drm_dp_add_payload_part2() - Execute payload update part 2
>>> - * @mgr: Manager to use.
>>> - * @state: The global atomic state
>>> - * @payload: The payload to update
>>> - *
>>> - * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
>>> - * function will send the sideband messages to finish allocating this payload.
>>> + * drm_dp_update_payload_part2() - Execute payload update part 2
>>> + * @mgr: manager to use.
>>>   *
>>> - * Returns: 0 on success, negative error code on failure.
>>> + * This iterates over all proposed virtual channels, and tries to
>>> + * allocate space in the link for them. For 0->slots transitions,
>>> + * this step writes the remote VC payload commands. For slots->0
>>> + * this just resets some internal state.
>>>   */
>>> -int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_atomic_state *state,
>>> -			     struct drm_dp_mst_atomic_payload *payload)
>>> +int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
>>>  {
>>> +	struct drm_dp_mst_port *port;
>>> +	int i;
>>>  	int ret = 0;
>>> +	bool skip;
>>>  
>>> -	/* Skip failed payloads */
>>> -	if (payload->vc_start_slot == -1) {
>>> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>>> -			    payload->port->connector->name);
>>> -		return -EIO;
>>> -	}
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	for (i = 0; i < mgr->max_payloads; i++) {
>>>  
>>> -	ret = drm_dp_create_payload_step2(mgr, payload);
>>> -	if (ret < 0) {
>>> -		if (!payload->delete)
>>> -			drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
>>> -				payload->port, ret);
>>> -		else
>>> -			drm_dbg_kms(mgr->dev, "Step 2 of removing MST payload for %p failed: %d\n",
>>> -				    payload->port, ret);
>>> -	}
>>> +		if (!mgr->proposed_vcpis[i])
>>> +			continue;
>>>  
>>> -	return ret;
>>> +		port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
>>> +
>>> +		mutex_lock(&mgr->lock);
>>> +		skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
>>> +		mutex_unlock(&mgr->lock);
>>> +
>>> +		if (skip)
>>> +			continue;
>>> +
>>> +		drm_dbg_kms(mgr->dev, "payload %d %d\n", i, mgr->payloads[i].payload_state);
>>> +		if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL) {
>>> +			ret = drm_dp_create_payload_step2(mgr, port, mgr->proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
>>> +		} else if (mgr->payloads[i].payload_state == DP_PAYLOAD_DELETE_LOCAL) {
>>> +			ret = drm_dp_destroy_payload_step2(mgr, mgr->proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
>>> +		}
>>> +		if (ret) {
>>> +			mutex_unlock(&mgr->payload_lock);
>>> +			return ret;
>>> +		}
>>> +	}
>>> +	mutex_unlock(&mgr->payload_lock);
>>> +	return 0;
>>>  }
>>> -EXPORT_SYMBOL(drm_dp_add_payload_part2);
>>> +EXPORT_SYMBOL(drm_dp_update_payload_part2);
>>>  
>>>  static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>>>  				 struct drm_dp_mst_port *port,
>>> @@ -3591,6 +3711,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>>>  	int ret = 0;
>>>  	struct drm_dp_mst_branch *mstb = NULL;
>>>  
>>> +	mutex_lock(&mgr->payload_lock);
>>>  	mutex_lock(&mgr->lock);
>>>  	if (mst_state == mgr->mst_state)
>>>  		goto out_unlock;
>>> @@ -3598,6 +3719,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>>>  	mgr->mst_state = mst_state;
>>>  	/* set the device into MST mode */
>>>  	if (mst_state) {
>>> +		struct drm_dp_payload reset_pay;
>>> +		int lane_count;
>>> +		int link_rate;
>>> +
>>>  		WARN_ON(mgr->mst_primary);
>>>  
>>>  		/* get dpcd info */
>>> @@ -3608,6 +3733,16 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>>>  			goto out_unlock;
>>>  		}
>>>  
>>> +		lane_count = min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
>>> +		link_rate = min_t(int, drm_dp_bw_code_to_link_rate(mgr->dpcd[1]), mgr->max_link_rate);
>>> +		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr,
>>> +							link_rate,
>>> +							lane_count);
>>> +		if (mgr->pbn_div == 0) {
>>> +			ret = -EINVAL;
>>> +			goto out_unlock;
>>> +		}
>>> +
>>>  		/* add initial branch device at LCT 1 */
>>>  		mstb = drm_dp_add_mst_branch_device(1, NULL);
>>>  		if (mstb == NULL) {
>>> @@ -3627,8 +3762,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>>>  		if (ret < 0)
>>>  			goto out_unlock;
>>>  
>>> -		/* Write reset payload */
>>> -		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
>>> +		reset_pay.start_slot = 0;
>>> +		reset_pay.num_slots = 0x3f;
>>> +		drm_dp_dpcd_write_payload(mgr, 0, &reset_pay);
>>>  
>>>  		queue_work(system_long_wq, &mgr->work);
>>>  
>>> @@ -3640,11 +3776,19 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>>>  		/* this can fail if the device is gone */
>>>  		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
>>>  		ret = 0;
>>> +		memset(mgr->payloads, 0,
>>> +		       mgr->max_payloads * sizeof(mgr->payloads[0]));
>>> +		memset(mgr->proposed_vcpis, 0,
>>> +		       mgr->max_payloads * sizeof(mgr->proposed_vcpis[0]));
>>> +		mgr->payload_mask = 0;
>>> +		set_bit(0, &mgr->payload_mask);
>>> +		mgr->vcpi_mask = 0;
>>>  		mgr->payload_id_table_cleared = false;
>>>  	}
>>>  
>>>  out_unlock:
>>>  	mutex_unlock(&mgr->lock);
>>> +	mutex_unlock(&mgr->payload_lock);
>>>  	if (mstb)
>>>  		drm_dp_mst_topology_put_mstb(mstb);
>>>  	return ret;
>>> @@ -4163,18 +4307,62 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
>>>  }
>>>  EXPORT_SYMBOL(drm_dp_mst_get_edid);
>>>  
>>> +/**
>>> + * drm_dp_find_vcpi_slots() - Find time slots for this PBN value
>>> + * @mgr: manager to use
>>> + * @pbn: payload bandwidth to convert into slots.
>>> + *
>>> + * Calculate the number of time slots that will be required for the given PBN
>>> + * value. This function is deprecated, and should not be used in atomic
>>> + * drivers.
>>> + *
>>> + * RETURNS:
>>> + * The total slots required for this port, or error.
>>> + */
>>> +int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>>> +			   int pbn)
>>> +{
>>> +	int num_slots;
>>> +
>>> +	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>>> +
>>> +	/* max. time slots - one slot for MTP header */
>>> +	if (num_slots > 63)
>>> +		return -ENOSPC;
>>> +	return num_slots;
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_find_vcpi_slots);
>>> +
>>> +static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>> +			    struct drm_dp_vcpi *vcpi, int pbn, int slots)
>>> +{
>>> +	int ret;
>>> +
>>> +	vcpi->pbn = pbn;
>>> +	vcpi->aligned_pbn = slots * mgr->pbn_div;
>>> +	vcpi->num_slots = slots;
>>> +
>>> +	ret = drm_dp_mst_assign_payload_id(mgr, vcpi);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	return 0;
>>> +}
>>> +
>>>  /**
>>>   * drm_dp_atomic_find_time_slots() - Find and add time slots to the state
>>>   * @state: global atomic state
>>>   * @mgr: MST topology manager for the port
>>>   * @port: port to find time slots for
>>>   * @pbn: bandwidth required for the mode in PBN
>>> + * @pbn_div: divider for DSC mode that takes FEC into account
>>>   *
>>> - * Allocates time slots to @port, replacing any previous time slot allocations it may
>>> - * have had. Any atomic drivers which support MST must call this function in
>>> - * their &drm_encoder_helper_funcs.atomic_check() callback unconditionally to
>>> - * change the current time slot allocation for the new state, and ensure the MST
>>> - * atomic state is added whenever the state of payloads in the topology changes.
>>> + * Allocates time slots to @port, replacing any previous timeslot allocations it
>>> + * may have had. Any atomic drivers which support MST must call this function
>>> + * in their &drm_encoder_helper_funcs.atomic_check() callback to change the
>>> + * current timeslot allocation for the new state, but only when
>>> + * &drm_crtc_state.mode_changed or &drm_crtc_state.connectors_changed is set
>>> + * to ensure compatibility with userspace applications that still use the
>>> + * legacy modesetting UAPI.
>>>   *
>>>   * Allocations set by this function are not checked against the bandwidth
>>>   * restraints of @mgr until the driver calls drm_dp_mst_atomic_check().
>>> @@ -4193,7 +4381,8 @@ EXPORT_SYMBOL(drm_dp_mst_get_edid);
>>>   */
>>>  int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>  				  struct drm_dp_mst_topology_mgr *mgr,
>>> -				  struct drm_dp_mst_port *port, int pbn)
>>> +				  struct drm_dp_mst_port *port, int pbn,
>>> +				  int pbn_div)
>>>  {
>>>  	struct drm_dp_mst_topology_state *topology_state;
>>>  	struct drm_dp_mst_atomic_payload *payload = NULL;
>>> @@ -4226,7 +4415,10 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>  		}
>>>  	}
>>>  
>>> -	req_slots = DIV_ROUND_UP(pbn, topology_state->pbn_div);
>>> +	if (pbn_div <= 0)
>>> +		pbn_div = mgr->pbn_div;
>>> +
>>> +	req_slots = DIV_ROUND_UP(pbn, pbn_div);
>>>  
>>>  	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
>>>  		       port->connector->base.id, port->connector->name,
>>> @@ -4235,7 +4427,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>  		       port->connector->base.id, port->connector->name,
>>>  		       port, prev_bw, pbn);
>>>  
>>> -	/* Add the new allocation to the state, note the VCPI isn't assigned until the end */
>>> +	/* Add the new allocation to the state */
>>>  	if (!payload) {
>>>  		payload = kzalloc(sizeof(*payload), GFP_KERNEL);
>>>  		if (!payload)
>>> @@ -4243,7 +4435,6 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>  
>>>  		drm_dp_mst_get_port_malloc(port);
>>>  		payload->port = port;
>>> -		payload->vc_start_slot = -1;
>>>  		list_add(&payload->next, &topology_state->payloads);
>>>  	}
>>>  	payload->time_slots = req_slots;
>>> @@ -4260,12 +4451,10 @@ EXPORT_SYMBOL(drm_dp_atomic_find_time_slots);
>>>   * @port: The port to release the time slots from
>>>   *
>>>   * Releases any time slots that have been allocated to a port in the atomic
>>> - * state. Any atomic drivers which support MST must call this function
>>> - * unconditionally in their &drm_connector_helper_funcs.atomic_check() callback.
>>> - * This helper will check whether time slots would be released by the new state and
>>> - * respond accordingly, along with ensuring the MST state is always added to the
>>> - * atomic state whenever a new state would modify the state of payloads on the
>>> - * topology.
>>> + * state. Any atomic drivers which support MST must call this function in
>>> + * their &drm_connector_helper_funcs.atomic_check() callback when the
>>> + * connector will no longer have VCPI allocated (e.g. because its CRTC was
>>> + * removed) when it had VCPI allocated in the previous atomic state.
>>>   *
>>>   * It is OK to call this even if @port has been removed from the system.
>>>   * Additionally, it is OK to call this function multiple times on the same
>>> @@ -4330,7 +4519,6 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>>>  		drm_dp_mst_put_port_malloc(port);
>>>  		payload->pbn = 0;
>>>  		payload->delete = true;
>>> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
>>>  	}
>>>  
>>>  	return 0;
>>> @@ -4381,8 +4569,7 @@ int drm_dp_mst_atomic_setup_commit(struct drm_atomic_state *state)
>>>  EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
>>>  
>>>  /**
>>> - * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending commits on MST topologies,
>>> - * prepare new MST state for commit
>>> + * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending commits on MST topologies
>>>   * @state: global atomic state
>>>   *
>>>   * Goes through any MST topologies in this atomic state, and waits for any pending commits which
>>> @@ -4400,30 +4587,17 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
>>>   */
>>>  void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
>>>  {
>>> -	struct drm_dp_mst_topology_state *old_mst_state, *new_mst_state;
>>> +	struct drm_dp_mst_topology_state *old_mst_state;
>>>  	struct drm_dp_mst_topology_mgr *mgr;
>>> -	struct drm_dp_mst_atomic_payload *old_payload, *new_payload;
>>>  	int i, j, ret;
>>>  
>>> -	for_each_oldnew_mst_mgr_in_state(state, mgr, old_mst_state, new_mst_state, i) {
>>> +	for_each_old_mst_mgr_in_state(state, mgr, old_mst_state, i) {
>>>  		for (j = 0; j < old_mst_state->num_commit_deps; j++) {
>>>  			ret = drm_crtc_commit_wait(old_mst_state->commit_deps[j]);
>>>  			if (ret < 0)
>>>  				drm_err(state->dev, "Failed to wait for %s: %d\n",
>>>  					old_mst_state->commit_deps[j]->crtc->name, ret);
>>>  		}
>>> -
>>> -		/* Now that previous state is committed, it's safe to copy over the start slot
>>> -		 * assignments
>>> -		 */
>>> -		list_for_each_entry(old_payload, &old_mst_state->payloads, next) {
>>> -			if (old_payload->delete)
>>> -				continue;
>>> -
>>> -			new_payload = drm_atomic_get_mst_payload_state(new_mst_state,
>>> -								       old_payload->port);
>>> -			new_payload->vc_start_slot = old_payload->vc_start_slot;
>>> -		}
>>>  	}
>>>  }
>>>  EXPORT_SYMBOL(drm_dp_mst_atomic_wait_for_dependencies);
>>> @@ -4508,8 +4682,119 @@ void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_
>>>  }
>>>  EXPORT_SYMBOL(drm_dp_mst_update_slots);
>>>  
>>> +/**
>>> + * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>>> + * @mgr: manager for this port
>>> + * @port: port to allocate a virtual channel for.
>>> + * @pbn: payload bandwidth number to request
>>> + * @slots: returned number of slots for this PBN.
>>> + */
>>> +bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>> +			      struct drm_dp_mst_port *port, int pbn, int slots)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (slots < 0)
>>> +		return false;
>>> +
>>> +	port = drm_dp_mst_topology_get_port_validated(mgr, port);
>>> +	if (!port)
>>> +		return false;
>>> +
>>> +	if (port->vcpi.vcpi > 0) {
>>> +		drm_dbg_kms(mgr->dev,
>>> +			    "payload: vcpi %d already allocated for pbn %d - requested pbn %d\n",
>>> +			    port->vcpi.vcpi, port->vcpi.pbn, pbn);
>>> +		if (pbn == port->vcpi.pbn) {
>>> +			drm_dp_mst_topology_put_port(port);
>>> +			return true;
>>> +		}
>>> +	}
>>> +
>>> +	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>>> +	if (ret) {
>>> +		drm_dbg_kms(mgr->dev, "failed to init time slots=%d ret=%d\n",
>>> +			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
>>> +		drm_dp_mst_topology_put_port(port);
>>> +		goto out;
>>> +	}
>>> +	drm_dbg_kms(mgr->dev, "initing vcpi for pbn=%d slots=%d\n", pbn, port->vcpi.num_slots);
>>> +
>>> +	/* Keep port allocated until its payload has been removed */
>>> +	drm_dp_mst_get_port_malloc(port);
>>> +	drm_dp_mst_topology_put_port(port);
>>> +	return true;
>>> +out:
>>> +	return false;
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_allocate_vcpi);
>>> +
>>> +int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port)
>>> +{
>>> +	int slots = 0;
>>> +
>>> +	port = drm_dp_mst_topology_get_port_validated(mgr, port);
>>> +	if (!port)
>>> +		return slots;
>>> +
>>> +	slots = port->vcpi.num_slots;
>>> +	drm_dp_mst_topology_put_port(port);
>>> +	return slots;
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_get_vcpi_slots);
>>> +
>>> +/**
>>> + * drm_dp_mst_reset_vcpi_slots() - Reset number of slots to 0 for VCPI
>>> + * @mgr: manager for this port
>>> + * @port: unverified pointer to a port.
>>> + *
>>> + * This just resets the number of slots for the ports VCPI for later programming.
>>> + */
>>> +void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port)
>>> +{
>>> +	/*
>>> +	 * A port with VCPI will remain allocated until its VCPI is
>>> +	 * released, no verified ref needed
>>> +	 */
>>> +
>>> +	port->vcpi.num_slots = 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
>>> +
>>> +/**
>>> + * drm_dp_mst_deallocate_vcpi() - deallocate a VCPI
>>> + * @mgr: manager for this port
>>> + * @port: port to deallocate vcpi for
>>> + *
>>> + * This can be called unconditionally, regardless of whether
>>> + * drm_dp_mst_allocate_vcpi() succeeded or not.
>>> + */
>>> +void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>> +				struct drm_dp_mst_port *port)
>>> +{
>>> +	bool skip;
>>> +
>>> +	if (!port->vcpi.vcpi)
>>> +		return;
>>> +
>>> +	mutex_lock(&mgr->lock);
>>> +	skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
>>> +	mutex_unlock(&mgr->lock);
>>> +
>>> +	if (skip)
>>> +		return;
>>> +
>>> +	drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
>>> +	port->vcpi.num_slots = 0;
>>> +	port->vcpi.pbn = 0;
>>> +	port->vcpi.aligned_pbn = 0;
>>> +	port->vcpi.vcpi = 0;
>>> +	drm_dp_mst_put_port_malloc(port);
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_deallocate_vcpi);
>>> +
>>>  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>>> -				     int id, u8 start_slot, u8 num_slots)
>>> +				     int id, struct drm_dp_payload *payload)
>>>  {
>>>  	u8 payload_alloc[3], status;
>>>  	int ret;
>>> @@ -4519,8 +4804,8 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>>>  			   DP_PAYLOAD_TABLE_UPDATED);
>>>  
>>>  	payload_alloc[0] = id;
>>> -	payload_alloc[1] = start_slot;
>>> -	payload_alloc[2] = num_slots;
>>> +	payload_alloc[1] = payload->start_slot;
>>> +	payload_alloc[2] = payload->num_slots;
>>>  
>>>  	ret = drm_dp_dpcd_write(mgr->aux, DP_PAYLOAD_ALLOCATE_SET, payload_alloc, 3);
>>>  	if (ret != 3) {
>>> @@ -4735,9 +5020,8 @@ static void fetch_monitor_name(struct drm_dp_mst_topology_mgr *mgr,
>>>  void drm_dp_mst_dump_topology(struct seq_file *m,
>>>  			      struct drm_dp_mst_topology_mgr *mgr)
>>>  {
>>> -	struct drm_dp_mst_topology_state *state;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> -	int i, ret;
>>> +	int i;
>>> +	struct drm_dp_mst_port *port;
>>>  
>>>  	mutex_lock(&mgr->lock);
>>>  	if (mgr->mst_primary)
>>> @@ -4746,35 +5030,36 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>>>  	/* dump VCPIs */
>>>  	mutex_unlock(&mgr->lock);
>>>  
>>> -	ret = drm_modeset_lock_single_interruptible(&mgr->base.lock);
>>> -	if (ret < 0)
>>> -		return;
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	seq_printf(m, "\n*** VCPI Info ***\n");
>>> +	seq_printf(m, "payload_mask: %lx, vcpi_mask: %lx, max_payloads: %d\n", mgr->payload_mask, mgr->vcpi_mask, mgr->max_payloads);
>>>  
>>> -	state = to_drm_dp_mst_topology_state(mgr->base.state);
>>> -	seq_printf(m, "\n*** Atomic state info ***\n");
>>> -	seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot: %u, pbn_div: %d\n",
>>> -		   state->payload_mask, mgr->max_payloads, state->start_slot, state->pbn_div);
>>> -
>>> -	seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     sink name     |\n");
>>> +	seq_printf(m, "\n|   idx   |  port # |  vcp_id | # slots |     sink name     |\n");
>>>  	for (i = 0; i < mgr->max_payloads; i++) {
>>> -		list_for_each_entry(payload, &state->payloads, next) {
>>> +		if (mgr->proposed_vcpis[i]) {
>>>  			char name[14];
>>>  
>>> -			if (payload->vcpi != i || payload->delete)
>>> -				continue;
>>> -
>>> -			fetch_monitor_name(mgr, payload->port, name, sizeof(name));
>>> -			seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %19s\n",
>>> +			port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
>>> +			fetch_monitor_name(mgr, port, name, sizeof(name));
>>> +			seq_printf(m, "%10d%10d%10d%10d%20s\n",
>>>  				   i,
>>> -				   payload->port->port_num,
>>> -				   payload->vcpi,
>>> -				   payload->vc_start_slot,
>>> -				   payload->vc_start_slot + payload->time_slots - 1,
>>> -				   payload->pbn,
>>> -				   payload->dsc_enabled ? "Y" : "N",
>>> +				   port->port_num,
>>> +				   port->vcpi.vcpi,
>>> +				   port->vcpi.num_slots,
>>>  				   (*name != 0) ? name : "Unknown");
>>> -		}
>>> +		} else
>>> +			seq_printf(m, "%6d - Unused\n", i);
>>> +	}
>>> +	seq_printf(m, "\n*** Payload Info ***\n");
>>> +	seq_printf(m, "|   idx   |  state  |  start slot  | # slots |\n");
>>> +	for (i = 0; i < mgr->max_payloads; i++) {
>>> +		seq_printf(m, "%10d%10d%15d%10d\n",
>>> +			   i,
>>> +			   mgr->payloads[i].payload_state,
>>> +			   mgr->payloads[i].start_slot,
>>> +			   mgr->payloads[i].num_slots);
>>>  	}
>>> +	mutex_unlock(&mgr->payload_lock);
>>>  
>>>  	seq_printf(m, "\n*** DPCD Info ***\n");
>>>  	mutex_lock(&mgr->lock);
>>> @@ -4820,7 +5105,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>>>  
>>>  out:
>>>  	mutex_unlock(&mgr->lock);
>>> -	drm_modeset_unlock(&mgr->base.lock);
>>> +
>>>  }
>>>  EXPORT_SYMBOL(drm_dp_mst_dump_topology);
>>>  
>>> @@ -5141,22 +5426,9 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
>>>  				       mgr, mst_state, mgr->max_payloads);
>>>  			return -EINVAL;
>>>  		}
>>> -
>>> -		/* Assign a VCPI */
>>> -		if (!payload->vcpi) {
>>> -			payload->vcpi = ffz(mst_state->payload_mask) + 1;
>>> -			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] assigned VCPI #%d\n",
>>> -				       payload->port, payload->vcpi);
>>> -			mst_state->payload_mask |= BIT(payload->vcpi - 1);
>>> -		}
>>>  	}
>>> -
>>> -	if (!payload_count)
>>> -		mst_state->pbn_div = 0;
>>> -
>>> -	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU pbn_div=%d avail=%d used=%d\n",
>>> -		       mgr, mst_state, mst_state->pbn_div, avail_slots,
>>> -		       mst_state->total_avail_slots - avail_slots);
>>> +	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU avail=%d used=%d\n",
>>> +		       mgr, mst_state, avail_slots, mst_state->total_avail_slots - avail_slots);
>>>  
>>>  	return 0;
>>>  }
>>> @@ -5227,6 +5499,7 @@ EXPORT_SYMBOL(drm_dp_mst_add_affected_dsc_crtcs);
>>>   * @state: Pointer to the new drm_atomic_state
>>>   * @port: Pointer to the affected MST Port
>>>   * @pbn: Newly recalculated bw required for link with DSC enabled
>>> + * @pbn_div: Divider to calculate correct number of pbn per slot
>>>   * @enable: Boolean flag to enable or disable DSC on the port
>>>   *
>>>   * This function enables DSC on the given Port
>>> @@ -5237,7 +5510,8 @@ EXPORT_SYMBOL(drm_dp_mst_add_affected_dsc_crtcs);
>>>   */
>>>  int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>>>  				 struct drm_dp_mst_port *port,
>>> -				 int pbn, bool enable)
>>> +				 int pbn, int pbn_div,
>>> +				 bool enable)
>>>  {
>>>  	struct drm_dp_mst_topology_state *mst_state;
>>>  	struct drm_dp_mst_atomic_payload *payload;
>>> @@ -5263,7 +5537,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>>>  	}
>>>  
>>>  	if (enable) {
>>> -		time_slots = drm_dp_atomic_find_time_slots(state, port->mgr, port, pbn);
>>> +		time_slots = drm_dp_atomic_find_time_slots(state, port->mgr, port, pbn, pbn_div);
>>>  		drm_dbg_atomic(state->dev,
>>>  			       "[MST PORT:%p] Enabling DSC flag, reallocating %d time slots on the port\n",
>>>  			       port, time_slots);
>>> @@ -5276,7 +5550,6 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>>>  	return time_slots;
>>>  }
>>>  EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
>>> -
>>>  /**
>>>   * drm_dp_mst_atomic_check - Check that the new state of an MST topology in an
>>>   * atomic update is valid
>>> @@ -5334,6 +5607,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
>>>  
>>>  /**
>>>   * drm_atomic_get_mst_topology_state: get MST topology state
>>> + *
>>>   * @state: global atomic state
>>>   * @mgr: MST topology manager, also the private object in this case
>>>   *
>>> @@ -5352,31 +5626,6 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
>>>  }
>>>  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>>>  
>>> -/**
>>> - * drm_atomic_get_new_mst_topology_state: get new MST topology state in atomic state, if any
>>> - * @state: global atomic state
>>> - * @mgr: MST topology manager, also the private object in this case
>>> - *
>>> - * This function wraps drm_atomic_get_priv_obj_state() passing in the MST atomic
>>> - * state vtable so that the private object state returned is that of a MST
>>> - * topology object.
>>> - *
>>> - * Returns:
>>> - *
>>> - * The MST topology state, or NULL if there's no topology state for this MST mgr
>>> - * in the global atomic state
>>> - */
>>> -struct drm_dp_mst_topology_state *
>>> -drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
>>> -				      struct drm_dp_mst_topology_mgr *mgr)
>>> -{
>>> -	struct drm_private_state *priv_state =
>>> -		drm_atomic_get_new_private_obj_state(state, &mgr->base);
>>> -
>>> -	return priv_state ? to_dp_mst_topology_state(priv_state) : NULL;
>>> -}
>>> -EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
>>> -
>>>  /**
>>>   * drm_dp_mst_topology_mgr_init - initialise a topology manager
>>>   * @mgr: manager struct to initialise
>>> @@ -5384,6 +5633,8 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
>>>   * @aux: DP helper aux channel to talk to this device
>>>   * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
>>>   * @max_payloads: maximum number of payloads this GPU can source
>>> + * @max_lane_count: maximum number of lanes this GPU supports
>>> + * @max_link_rate: maximum link rate per lane this GPU supports in kHz
>>>   * @conn_base_id: the connector object ID the MST device is connected to.
>>>   *
>>>   * Return 0 for success, or negative error code on failure
>>> @@ -5391,12 +5642,14 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
>>>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>>>  				 struct drm_device *dev, struct drm_dp_aux *aux,
>>>  				 int max_dpcd_transaction_bytes, int max_payloads,
>>> +				 int max_lane_count, int max_link_rate,
>>>  				 int conn_base_id)
>>>  {
>>>  	struct drm_dp_mst_topology_state *mst_state;
>>>  
>>>  	mutex_init(&mgr->lock);
>>>  	mutex_init(&mgr->qlock);
>>> +	mutex_init(&mgr->payload_lock);
>>>  	mutex_init(&mgr->delayed_destroy_lock);
>>>  	mutex_init(&mgr->up_req_lock);
>>>  	mutex_init(&mgr->probe_lock);
>>> @@ -5426,7 +5679,19 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>>>  	mgr->aux = aux;
>>>  	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
>>>  	mgr->max_payloads = max_payloads;
>>> +	mgr->max_lane_count = max_lane_count;
>>> +	mgr->max_link_rate = max_link_rate;
>>>  	mgr->conn_base_id = conn_base_id;
>>> +	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
>>> +	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
>>> +		return -EINVAL;
>>> +	mgr->payloads = kcalloc(max_payloads, sizeof(struct drm_dp_payload), GFP_KERNEL);
>>> +	if (!mgr->payloads)
>>> +		return -ENOMEM;
>>> +	mgr->proposed_vcpis = kcalloc(max_payloads, sizeof(struct drm_dp_vcpi *), GFP_KERNEL);
>>> +	if (!mgr->proposed_vcpis)
>>> +		return -ENOMEM;
>>> +	set_bit(0, &mgr->payload_mask);
>>>  
>>>  	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>>>  	if (mst_state == NULL)
>>> @@ -5459,12 +5724,19 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr)
>>>  		destroy_workqueue(mgr->delayed_destroy_wq);
>>>  		mgr->delayed_destroy_wq = NULL;
>>>  	}
>>> +	mutex_lock(&mgr->payload_lock);
>>> +	kfree(mgr->payloads);
>>> +	mgr->payloads = NULL;
>>> +	kfree(mgr->proposed_vcpis);
>>> +	mgr->proposed_vcpis = NULL;
>>> +	mutex_unlock(&mgr->payload_lock);
>>>  	mgr->dev = NULL;
>>>  	mgr->aux = NULL;
>>>  	drm_atomic_private_obj_fini(&mgr->base);
>>>  	mgr->funcs = NULL;
>>>  
>>>  	mutex_destroy(&mgr->delayed_destroy_lock);
>>> +	mutex_destroy(&mgr->payload_lock);
>>>  	mutex_destroy(&mgr->qlock);
>>>  	mutex_destroy(&mgr->lock);
>>>  	mutex_destroy(&mgr->up_req_lock);
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> index 8b0e4defa3f1..4428eabc6ff7 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> @@ -57,7 +57,6 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>>>  	struct drm_atomic_state *state = crtc_state->uapi.state;
>>>  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
>>>  	struct intel_dp *intel_dp = &intel_mst->primary->dp;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>>  	struct intel_connector *connector =
>>>  		to_intel_connector(conn_state->connector);
>>>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>>> @@ -66,30 +65,23 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>>>  	int bpp, slots = -EINVAL;
>>>  	int ret = 0;
>>>  
>>> -	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
>>> -	if (IS_ERR(mst_state))
>>> -		return PTR_ERR(mst_state);
>>> -
>>>  	crtc_state->lane_count = limits->max_lane_count;
>>>  	crtc_state->port_clock = limits->max_rate;
>>>  
>>> -	// TODO: Handle pbn_div changes by adding a new MST helper
>>> -	if (!mst_state->pbn_div) {
>>> -		mst_state->pbn_div = drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
>>> -							      crtc_state->port_clock,
>>> -							      crtc_state->lane_count);
>>> -	}
>>> +	for (bpp = limits->max_bpp; bpp >= limits->min_bpp; bpp -= 2 * 3) {
>>> +		crtc_state->pipe_bpp = bpp;
>>>  
>>> -	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
>>>  		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
>>>  						       dsc ? bpp << 4 : bpp,
>>>  						       dsc);
>>>  
>>> -		drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
>>> -
>>>  		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>>>  						      connector->port,
>>> -						      crtc_state->pbn);
>>> +						      crtc_state->pbn,
>>> +						      drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
>>> +									       crtc_state->port_clock,
>>> +									       crtc_state->lane_count));
>>> +
>>>  		if (slots == -EDEADLK)
>>>  			return slots;
>>>  
>>> @@ -524,17 +516,21 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>>>  	struct intel_dp *intel_dp = &dig_port->dp;
>>>  	struct intel_connector *connector =
>>>  		to_intel_connector(old_conn_state->connector);
>>> -	struct drm_dp_mst_topology_state *mst_state =
>>> -		drm_atomic_get_mst_topology_state(&state->base, &intel_dp->mst_mgr);
>>>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>>> +	int start_slot = intel_dp_is_uhbr(old_crtc_state) ? 0 : 1;
>>> +	int ret;
>>>  
>>>  	drm_dbg_kms(&i915->drm, "active links %d\n",
>>>  		    intel_dp->active_mst_links);
>>>  
>>>  	intel_hdcp_disable(intel_mst->connector);
>>>  
>>> -	drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
>>> -			      drm_atomic_get_mst_payload_state(mst_state, connector->port));
>>> +	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>>> +
>>> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
>>> +	if (ret) {
>>> +		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
>>> +	}
>>>  
>>>  	intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
>>>  }
>>> @@ -562,6 +558,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
>>>  
>>>  	intel_disable_transcoder(old_crtc_state);
>>>  
>>> +	drm_dp_update_payload_part2(&intel_dp->mst_mgr);
>>> +
>>>  	clear_act_sent(encoder, old_crtc_state);
>>>  
>>>  	intel_de_rmw(dev_priv, TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transcoder),
>>> @@ -569,6 +567,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
>>>  
>>>  	wait_for_act_sent(encoder, old_crtc_state);
>>>  
>>> +	drm_dp_mst_deallocate_vcpi(&intel_dp->mst_mgr, connector->port);
>>> +
>>>  	intel_ddi_disable_transcoder_func(old_crtc_state);
>>>  
>>>  	if (DISPLAY_VER(dev_priv) >= 9)
>>> @@ -635,8 +635,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
>>>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>>>  	struct intel_connector *connector =
>>>  		to_intel_connector(conn_state->connector);
>>> -	struct drm_dp_mst_topology_state *mst_state =
>>> -		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
>>> +	int start_slot = intel_dp_is_uhbr(pipe_config) ? 0 : 1;
>>>  	int ret;
>>>  	bool first_mst_stream;
>>>  
>>> @@ -662,13 +661,16 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
>>>  		dig_port->base.pre_enable(state, &dig_port->base,
>>>  						pipe_config, NULL);
>>>  
>>> +	ret = drm_dp_mst_allocate_vcpi(&intel_dp->mst_mgr,
>>> +				       connector->port,
>>> +				       pipe_config->pbn,
>>> +				       pipe_config->dp_m_n.tu);
>>> +	if (!ret)
>>> +		drm_err(&dev_priv->drm, "failed to allocate vcpi\n");
>>> +
>>>  	intel_dp->active_mst_links++;
>>>  
>>> -	ret = drm_dp_add_payload_part1(&intel_dp->mst_mgr, mst_state,
>>> -				       drm_atomic_get_mst_payload_state(mst_state, connector->port));
>>> -	if (ret < 0)
>>> -		drm_err(&dev_priv->drm, "Failed to create MST payload for %s: %d\n",
>>> -			connector->base.name, ret);
>>> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
>>>  
>>>  	/*
>>>  	 * Before Gen 12 this is not done as part of
>>> @@ -691,10 +693,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>>>  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
>>>  	struct intel_digital_port *dig_port = intel_mst->primary;
>>>  	struct intel_dp *intel_dp = &dig_port->dp;
>>> -	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>>>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>>> -	struct drm_dp_mst_topology_state *mst_state =
>>> -		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
>>>  	enum transcoder trans = pipe_config->cpu_transcoder;
>>>  
>>>  	drm_WARN_ON(&dev_priv->drm, pipe_config->has_pch_encoder);
>>> @@ -722,8 +721,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>>>  
>>>  	wait_for_act_sent(encoder, pipe_config);
>>>  
>>> -	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
>>> -				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
>>> +	drm_dp_update_payload_part2(&intel_dp->mst_mgr);
>>>  
>>>  	if (DISPLAY_VER(dev_priv) >= 14 && pipe_config->fec_enable)
>>>  		intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(trans), 0,
>>> @@ -1170,6 +1168,8 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>>>  	struct intel_dp *intel_dp = &dig_port->dp;
>>>  	enum port port = dig_port->base.port;
>>>  	int ret;
>>> +	int max_source_rate =
>>> +		intel_dp->source_rates[intel_dp->num_source_rates - 1];
>>>  
>>>  	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
>>>  		return 0;
>>> @@ -1185,7 +1185,10 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>>>  	/* create encoders */
>>>  	intel_dp_create_fake_mst_encoders(dig_port);
>>>  	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
>>> -					   &intel_dp->aux, 16, 3, conn_base_id);
>>> +					   &intel_dp->aux, 16, 3,
>>> +					   dig_port->max_lanes,
>>> +					   max_source_rate,
>>> +					   conn_base_id);
>>>  	if (ret) {
>>>  		intel_dp->mst_mgr.cbs = NULL;
>>>  		return ret;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> index 6406fd487ee5..987e02eea66a 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
>>> @@ -31,30 +31,8 @@
>>>  
>>>  static int intel_conn_to_vcpi(struct intel_connector *connector)
>>>  {
>>> -	struct drm_dp_mst_topology_mgr *mgr;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>> -	int vcpi = 0;
>>> -
>>>  	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
>>> -	if (!connector->port)
>>> -		return 0;
>>> -	mgr = connector->port->mgr;
>>> -
>>> -	drm_modeset_lock(&mgr->base.lock, NULL);
>>> -	mst_state = to_drm_dp_mst_topology_state(mgr->base.state);
>>> -	payload = drm_atomic_get_mst_payload_state(mst_state, connector->port);
>>> -	if (drm_WARN_ON(mgr->dev, !payload))
>>> -		goto out;
>>> -
>>> -	vcpi = payload->vcpi;
>>> -	if (drm_WARN_ON(mgr->dev, vcpi < 0)) {
>>> -		vcpi = 0;
>>> -		goto out;
>>> -	}
>>> -out:
>>> -	drm_modeset_unlock(&mgr->base.lock);
>>> -	return vcpi;
>>> +	return connector->port	? connector->port->vcpi.vcpi : 0;
>>>  }
>>>  
>>>  /*
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> index edcb2529b402..9bebe2a5e284 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> @@ -831,7 +831,6 @@ struct nv50_msto {
>>>  	struct nv50_head *head;
>>>  	struct nv50_mstc *mstc;
>>>  	bool disabled;
>>> -	bool enabled;
>>>  };
>>>  
>>>  struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
>>> @@ -847,55 +846,82 @@ struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
>>>  	return msto->mstc->mstm->outp;
>>>  }
>>>  
>>> +static struct drm_dp_payload *
>>> +nv50_msto_payload(struct nv50_msto *msto)
>>> +{
>>> +	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
>>> +	struct nv50_mstc *mstc = msto->mstc;
>>> +	struct nv50_mstm *mstm = mstc->mstm;
>>> +	int vcpi = mstc->port->vcpi.vcpi, i;
>>> +
>>> +	WARN_ON(!mutex_is_locked(&mstm->mgr.payload_lock));
>>> +
>>> +	NV_ATOMIC(drm, "%s: vcpi %d\n", msto->encoder.name, vcpi);
>>> +	for (i = 0; i < mstm->mgr.max_payloads; i++) {
>>> +		struct drm_dp_payload *payload = &mstm->mgr.payloads[i];
>>> +		NV_ATOMIC(drm, "%s: %d: vcpi %d start 0x%02x slots 0x%02x\n",
>>> +			  mstm->outp->base.base.name, i, payload->vcpi,
>>> +			  payload->start_slot, payload->num_slots);
>>> +	}
>>> +
>>> +	for (i = 0; i < mstm->mgr.max_payloads; i++) {
>>> +		struct drm_dp_payload *payload = &mstm->mgr.payloads[i];
>>> +		if (payload->vcpi == vcpi)
>>> +			return payload;
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>>  static void
>>> -nv50_msto_cleanup(struct drm_atomic_state *state,
>>> -		  struct drm_dp_mst_topology_state *mst_state,
>>> -		  struct drm_dp_mst_topology_mgr *mgr,
>>> -		  struct nv50_msto *msto)
>>> +nv50_msto_cleanup(struct nv50_msto *msto)
>>>  {
>>>  	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
>>> -	struct drm_dp_mst_atomic_payload *payload =
>>> -		drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
>>> +	struct nv50_mstc *mstc = msto->mstc;
>>> +	struct nv50_mstm *mstm = mstc->mstm;
>>> +
>>> +	if (!msto->disabled)
>>> +		return;
>>>  
>>>  	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
>>>  
>>> -	if (msto->disabled) {
>>> -		msto->mstc = NULL;
>>> -		msto->disabled = false;
>>> -	} else if (msto->enabled) {
>>> -		drm_dp_add_payload_part2(mgr, state, payload);
>>> -		msto->enabled = false;
>>> -	}
>>> +	drm_dp_mst_deallocate_vcpi(&mstm->mgr, mstc->port);
>>> +
>>> +	msto->mstc = NULL;
>>> +	msto->disabled = false;
>>>  }
>>>  
>>>  static void
>>> -nv50_msto_prepare(struct drm_atomic_state *state,
>>> -		  struct drm_dp_mst_topology_state *mst_state,
>>> -		  struct drm_dp_mst_topology_mgr *mgr,
>>> -		  struct nv50_msto *msto)
>>> +nv50_msto_prepare(struct nv50_msto *msto)
>>>  {
>>>  	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
>>>  	struct nv50_mstc *mstc = msto->mstc;
>>>  	struct nv50_mstm *mstm = mstc->mstm;
>>> -	struct drm_dp_mst_atomic_payload *payload;
>>> +	struct drm_dp_payload *payload = NULL;
>>>  
>>> -	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
>>> +	mutex_lock(&mstm->mgr.payload_lock);
>>>  
>>> -	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
>>> +	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
>>>  
>>> -	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
>>> -	if (msto->disabled) {
>>> -		drm_dp_remove_payload(mgr, mst_state, payload);
>>> +	if (mstc->port->vcpi.vcpi > 0)
>>> +		payload = nv50_msto_payload(msto);
>>>  
>>> -		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
>>> -	} else {
>>> -		if (msto->enabled)
>>> -			drm_dp_add_payload_part1(mgr, mst_state, payload);
>>> +	if (payload) {
>>> +		NV_ATOMIC(drm, "%s: %s: %02x %02x %04x %04x\n",
>>> +			  msto->encoder.name, msto->head->base.base.name,
>>> +			  payload->start_slot, payload->num_slots,
>>> +			  mstc->port->vcpi.pbn, mstc->port->vcpi.aligned_pbn);
>>>  
>>>  		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
>>> -				      payload->vc_start_slot, payload->time_slots,
>>> -				      payload->pbn, payload->time_slots * mst_state->pbn_div);
>>> +				      payload->start_slot, payload->num_slots,
>>> +				      mstc->port->vcpi.pbn, mstc->port->vcpi.aligned_pbn);
>>> +	} else {
>>> +		NV_ATOMIC(drm, "%s: %s: %02x %02x %04x %04x\n",
>>> +			  msto->encoder.name, msto->head->base.base.name, 0, 0, 0, 0);
>>> +		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
>>>  	}
>>> +
>>> +	mutex_unlock(&mstm->mgr.payload_lock);
>>>  }
>>>  
>>>  static int
>>> @@ -905,7 +931,6 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>>>  {
>>>  	struct drm_atomic_state *state = crtc_state->state;
>>>  	struct drm_connector *connector = conn_state->connector;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>>  	struct nv50_mstc *mstc = nv50_mstc(connector);
>>>  	struct nv50_mstm *mstm = mstc->mstm;
>>>  	struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
>>> @@ -933,18 +958,8 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>>>  						    false);
>>>  	}
>>>  
>>> -	mst_state = drm_atomic_get_mst_topology_state(state, &mstm->mgr);
>>> -	if (IS_ERR(mst_state))
>>> -		return PTR_ERR(mst_state);
>>> -
>>> -	if (!mst_state->pbn_div) {
>>> -		struct nouveau_encoder *outp = mstc->mstm->outp;
>>> -
>>> -		mst_state->pbn_div = drm_dp_get_vc_payload_bw(&mstm->mgr,
>>> -							      outp->dp.link_bw, outp->dp.link_nr);
>>> -	}
>>> -
>>> -	slots = drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc->port, asyh->dp.pbn);
>>> +	slots = drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc->port,
>>> +					      asyh->dp.pbn, 0);
>>>  	if (slots < 0)
>>>  		return slots;
>>>  
>>> @@ -976,6 +991,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
>>>  	struct drm_connector *connector;
>>>  	struct drm_connector_list_iter conn_iter;
>>>  	u8 proto;
>>> +	bool r;
>>>  
>>>  	drm_connector_list_iter_begin(encoder->dev, &conn_iter);
>>>  	drm_for_each_connector_iter(connector, &conn_iter) {
>>> @@ -990,6 +1006,10 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
>>>  	if (WARN_ON(!mstc))
>>>  		return;
>>>  
>>> +	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, asyh->dp.pbn, asyh->dp.tu);
>>> +	if (!r)
>>> +		DRM_DEBUG_KMS("Failed to allocate VCPI\n");
>>> +
>>>  	if (!mstm->links++) {
>>>  		/*XXX: MST audio. */
>>>  		nvif_outp_acquire_dp(&mstm->outp->outp, mstm->outp->dp.dpcd, 0, 0, false, true);
>>> @@ -1004,7 +1024,6 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
>>>  			   nv50_dp_bpc_to_depth(asyh->or.bpc));
>>>  
>>>  	msto->mstc = mstc;
>>> -	msto->enabled = true;
>>>  	mstm->modified = true;
>>>  }
>>>  
>>> @@ -1015,6 +1034,8 @@ nv50_msto_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *s
>>>  	struct nv50_mstc *mstc = msto->mstc;
>>>  	struct nv50_mstm *mstm = mstc->mstm;
>>>  
>>> +	drm_dp_mst_reset_vcpi_slots(&mstm->mgr, mstc->port);
>>> +
>>>  	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
>>>  	mstm->modified = true;
>>>  	if (!--mstm->links)
>>> @@ -1234,9 +1255,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
>>>  }
>>>  
>>>  static void
>>> -nv50_mstm_cleanup(struct drm_atomic_state *state,
>>> -		  struct drm_dp_mst_topology_state *mst_state,
>>> -		  struct nv50_mstm *mstm)
>>> +nv50_mstm_cleanup(struct nv50_mstm *mstm)
>>>  {
>>>  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>>>  	struct drm_encoder *encoder;
>>> @@ -1244,12 +1263,14 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
>>>  	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
>>>  	drm_dp_check_act_status(&mstm->mgr);
>>>  
>>> +	drm_dp_update_payload_part2(&mstm->mgr);
>>> +
>>>  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>>>  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
>>>  			struct nv50_msto *msto = nv50_msto(encoder);
>>>  			struct nv50_mstc *mstc = msto->mstc;
>>>  			if (mstc && mstc->mstm == mstm)
>>> -				nv50_msto_cleanup(state, mst_state, &mstm->mgr, msto);
>>> +				nv50_msto_cleanup(msto);
>>>  		}
>>>  	}
>>>  
>>> @@ -1257,34 +1278,20 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
>>>  }
>>>  
>>>  static void
>>> -nv50_mstm_prepare(struct drm_atomic_state *state,
>>> -		  struct drm_dp_mst_topology_state *mst_state,
>>> -		  struct nv50_mstm *mstm)
>>> +nv50_mstm_prepare(struct nv50_mstm *mstm)
>>>  {
>>>  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>>>  	struct drm_encoder *encoder;
>>>  
>>>  	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
>>> +	drm_dp_update_payload_part1(&mstm->mgr, 1);
>>>  
>>> -	/* Disable payloads first */
>>> -	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>>> -		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
>>> -			struct nv50_msto *msto = nv50_msto(encoder);
>>> -			struct nv50_mstc *mstc = msto->mstc;
>>> -			if (mstc && mstc->mstm == mstm && msto->disabled)
>>> -				nv50_msto_prepare(state, mst_state, &mstm->mgr, msto);
>>> -		}
>>> -	}
>>> -
>>> -	/* Add payloads for new heads, while also updating the start slots of any unmodified (but
>>> -	 * active) heads that may have had their VC slots shifted left after the previous step
>>> -	 */
>>>  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>>>  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
>>>  			struct nv50_msto *msto = nv50_msto(encoder);
>>>  			struct nv50_mstc *mstc = msto->mstc;
>>> -			if (mstc && mstc->mstm == mstm && !msto->disabled)
>>> -				nv50_msto_prepare(state, mst_state, &mstm->mgr, msto);
>>> +			if (mstc && mstc->mstm == mstm)
>>> +				nv50_msto_prepare(msto);
>>>  		}
>>>  	}
>>>  
>>> @@ -1455,7 +1462,9 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
>>>  	mstm->mgr.cbs = &nv50_mstm;
>>>  
>>>  	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
>>> -					   max_payloads, conn_base_id);
>>> +					   max_payloads, outp->dcb->dpconf.link_nr,
>>> +					   drm_dp_bw_code_to_link_rate(outp->dcb->dpconf.link_bw),
>>> +					   conn_base_id);
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> @@ -1902,20 +1911,20 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
>>>  static void
>>>  nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
>>>  {
>>> -	struct drm_dp_mst_topology_mgr *mgr;
>>> -	struct drm_dp_mst_topology_state *mst_state;
>>>  	struct nouveau_drm *drm = nouveau_drm(state->dev);
>>>  	struct nv50_disp *disp = nv50_disp(drm->dev);
>>>  	struct nv50_core *core = disp->core;
>>>  	struct nv50_mstm *mstm;
>>> -	int i;
>>> +	struct drm_encoder *encoder;
>>>  
>>>  	NV_ATOMIC(drm, "commit core %08x\n", interlock[NV50_DISP_INTERLOCK_BASE]);
>>>  
>>> -	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>>> -		mstm = nv50_mstm(mgr);
>>> -		if (mstm->modified)
>>> -			nv50_mstm_prepare(state, mst_state, mstm);
>>> +	drm_for_each_encoder(encoder, drm->dev) {
>>> +		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
>>> +			mstm = nouveau_encoder(encoder)->dp.mstm;
>>> +			if (mstm && mstm->modified)
>>> +				nv50_mstm_prepare(mstm);
>>> +		}
>>>  	}
>>>  
>>>  	core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
>>> @@ -1924,10 +1933,12 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
>>>  				       disp->core->chan.base.device))
>>>  		NV_ERROR(drm, "core notifier timeout\n");
>>>  
>>> -	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
>>> -		mstm = nv50_mstm(mgr);
>>> -		if (mstm->modified)
>>> -			nv50_mstm_cleanup(state, mst_state, mstm);
>>> +	drm_for_each_encoder(encoder, drm->dev) {
>>> +		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
>>> +			mstm = nouveau_encoder(encoder)->dp.mstm;
>>> +			if (mstm && mstm->modified)
>>> +				nv50_mstm_cleanup(mstm);
>>> +		}
>>>  	}
>>>  }
>>>  
>>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>>> index 41fd8352ab65..6b8f738bd622 100644
>>> --- a/include/drm/display/drm_dp_mst_helper.h
>>> +++ b/include/drm/display/drm_dp_mst_helper.h
>>> @@ -48,6 +48,20 @@ struct drm_dp_mst_topology_ref_history {
>>>  
>>>  struct drm_dp_mst_branch;
>>>  
>>> +/**
>>> + * struct drm_dp_vcpi - Virtual Channel Payload Identifier
>>> + * @vcpi: Virtual channel ID.
>>> + * @pbn: Payload Bandwidth Number for this channel
>>> + * @aligned_pbn: PBN aligned with slot size
>>> + * @num_slots: number of slots for this PBN
>>> + */
>>> +struct drm_dp_vcpi {
>>> +	int vcpi;
>>> +	int pbn;
>>> +	int aligned_pbn;
>>> +	int num_slots;
>>> +};
>>> +
>>>  /**
>>>   * struct drm_dp_mst_port - MST port
>>>   * @port_num: port number
>>> @@ -131,6 +145,7 @@ struct drm_dp_mst_port {
>>>  	struct drm_dp_aux *passthrough_aux;
>>>  	struct drm_dp_mst_branch *parent;
>>>  
>>> +	struct drm_dp_vcpi vcpi;
>>>  	struct drm_connector *connector;
>>>  	struct drm_dp_mst_topology_mgr *mgr;
>>>  
>>> @@ -515,6 +530,19 @@ struct drm_dp_mst_topology_cbs {
>>>  	void (*poll_hpd_irq)(struct drm_dp_mst_topology_mgr *mgr);
>>>  };
>>>  
>>> +#define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
>>> +
>>> +#define DP_PAYLOAD_LOCAL 1
>>> +#define DP_PAYLOAD_REMOTE 2
>>> +#define DP_PAYLOAD_DELETE_LOCAL 3
>>> +
>>> +struct drm_dp_payload {
>>> +	int payload_state;
>>> +	int start_slot;
>>> +	int num_slots;
>>> +	int vcpi;
>>> +};
>>> +
>>>  #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
>>>  
>>>  /**
>>> @@ -527,34 +555,6 @@ struct drm_dp_mst_atomic_payload {
>>>  	/** @port: The MST port assigned to this payload */
>>>  	struct drm_dp_mst_port *port;
>>>  
>>> -	/**
>>> -	 * @vc_start_slot: The time slot that this payload starts on. Because payload start slots
>>> -	 * can't be determined ahead of time, the contents of this value are UNDEFINED at atomic
>>> -	 * check time. This shouldn't usually matter, as the start slot should never be relevant for
>>> -	 * atomic state computations.
>>> -	 *
>>> -	 * Since this value is determined at commit time instead of check time, this value is
>>> -	 * protected by the MST helpers ensuring that async commits operating on the given topology
>>> -	 * never run in parallel. In the event that a driver does need to read this value (e.g. to
>>> -	 * inform hardware of the starting timeslot for a payload), the driver may either:
>>> -	 *
>>> -	 * * Read this field during the atomic commit after
>>> -	 *   drm_dp_mst_atomic_wait_for_dependencies() has been called, which will ensure the
>>> -	 *   previous MST states payload start slots have been copied over to the new state. Note
>>> -	 *   that a new start slot won't be assigned/removed from this payload until
>>> -	 *   drm_dp_add_payload_part1()/drm_dp_remove_payload() have been called.
>>> -	 * * Acquire the MST modesetting lock, and then wait for any pending MST-related commits to
>>> -	 *   get committed to hardware by calling drm_crtc_commit_wait() on each of the
>>> -	 *   &drm_crtc_commit structs in &drm_dp_mst_topology_state.commit_deps.
>>> -	 *
>>> -	 * If neither of the two above solutions suffice (e.g. the driver needs to read the start
>>> -	 * slot in the middle of an atomic commit without waiting for some reason), then drivers
>>> -	 * should cache this value themselves after changing payloads.
>>> -	 */
>>> -	s8 vc_start_slot;
>>> -
>>> -	/** @vcpi: The Virtual Channel Payload Identifier */
>>> -	u8 vcpi;
>>>  	/**
>>>  	 * @time_slots:
>>>  	 * The number of timeslots allocated to this payload from the source DP Tx to
>>> @@ -582,6 +582,8 @@ struct drm_dp_mst_topology_state {
>>>  	/** @base: Base private state for atomic */
>>>  	struct drm_private_state base;
>>>  
>>> +	/** @payloads: The list of payloads being created/destroyed in this state */
>>> +	struct list_head payloads;
>>>  	/** @mgr: The topology manager */
>>>  	struct drm_dp_mst_topology_mgr *mgr;
>>>  
>>> @@ -598,21 +600,10 @@ struct drm_dp_mst_topology_state {
>>>  	/** @num_commit_deps: The number of CRTC commits in @commit_deps */
>>>  	size_t num_commit_deps;
>>>  
>>> -	/** @payload_mask: A bitmask of allocated VCPIs, used for VCPI assignments */
>>> -	u32 payload_mask;
>>> -	/** @payloads: The list of payloads being created/destroyed in this state */
>>> -	struct list_head payloads;
>>> -
>>>  	/** @total_avail_slots: The total number of slots this topology can handle (63 or 64) */
>>>  	u8 total_avail_slots;
>>>  	/** @start_slot: The first usable time slot in this topology (1 or 0) */
>>>  	u8 start_slot;
>>> -
>>> -	/**
>>> -	 * @pbn_div: The current PBN divisor for this topology. The driver is expected to fill this
>>> -	 * out itself.
>>> -	 */
>>> -	int pbn_div;
>>>  };
>>>  
>>>  #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topology_mgr, base)
>>> @@ -652,6 +643,14 @@ struct drm_dp_mst_topology_mgr {
>>>  	 * @max_payloads: maximum number of payloads the GPU can generate.
>>>  	 */
>>>  	int max_payloads;
>>> +	/**
>>> +	 * @max_lane_count: maximum number of lanes the GPU can drive.
>>> +	 */
>>> +	int max_lane_count;
>>> +	/**
>>> +	 * @max_link_rate: maximum link rate per lane GPU can output, in kHz.
>>> +	 */
>>> +	int max_link_rate;
>>>  	/**
>>>  	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
>>>  	 * to build the MST connector path value.
>>> @@ -694,20 +693,6 @@ struct drm_dp_mst_topology_mgr {
>>>  	 */
>>>  	bool payload_id_table_cleared : 1;
>>>  
>>> -	/**
>>> -	 * @payload_count: The number of currently active payloads in hardware. This value is only
>>> -	 * intended to be used internally by MST helpers for payload tracking, and is only safe to
>>> -	 * read/write from the atomic commit (not check) context.
>>> -	 */
>>> -	u8 payload_count;
>>> -
>>> -	/**
>>> -	 * @next_start_slot: The starting timeslot to use for new VC payloads. This value is used
>>> -	 * internally by MST helpers for payload tracking, and is only safe to read/write from the
>>> -	 * atomic commit (not check) context.
>>> -	 */
>>> -	u8 next_start_slot;
>>> -
>>>  	/**
>>>  	 * @mst_primary: Pointer to the primary/first branch device.
>>>  	 */
>>> @@ -721,6 +706,10 @@ struct drm_dp_mst_topology_mgr {
>>>  	 * @sink_count: Sink count from DEVICE_SERVICE_IRQ_VECTOR_ESI0.
>>>  	 */
>>>  	u8 sink_count;
>>> +	/**
>>> +	 * @pbn_div: PBN to slots divisor.
>>> +	 */
>>> +	int pbn_div;
>>>  
>>>  	/**
>>>  	 * @funcs: Atomic helper callbacks
>>> @@ -737,6 +726,32 @@ struct drm_dp_mst_topology_mgr {
>>>  	 */
>>>  	struct list_head tx_msg_downq;
>>>  
>>> +	/**
>>> +	 * @payload_lock: Protect payload information.
>>> +	 */
>>> +	struct mutex payload_lock;
>>> +	/**
>>> +	 * @proposed_vcpis: Array of pointers for the new VCPI allocation. The
>>> +	 * VCPI structure itself is &drm_dp_mst_port.vcpi, and the size of
>>> +	 * this array is determined by @max_payloads.
>>> +	 */
>>> +	struct drm_dp_vcpi **proposed_vcpis;
>>> +	/**
>>> +	 * @payloads: Array of payloads. The size of this array is determined
>>> +	 * by @max_payloads.
>>> +	 */
>>> +	struct drm_dp_payload *payloads;
>>> +	/**
>>> +	 * @payload_mask: Elements of @payloads actually in use. Since
>>> +	 * reallocation of active outputs isn't possible gaps can be created by
>>> +	 * disabling outputs out of order compared to how they've been enabled.
>>> +	 */
>>> +	unsigned long payload_mask;
>>> +	/**
>>> +	 * @vcpi_mask: Similar to @payload_mask, but for @proposed_vcpis.
>>> +	 */
>>> +	unsigned long vcpi_mask;
>>> +
>>>  	/**
>>>  	 * @tx_waitq: Wait to queue stall for the tx worker.
>>>  	 */
>>> @@ -808,7 +823,9 @@ struct drm_dp_mst_topology_mgr {
>>>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>>>  				 struct drm_device *dev, struct drm_dp_aux *aux,
>>>  				 int max_dpcd_transaction_bytes,
>>> -				 int max_payloads, int conn_base_id);
>>> +				 int max_payloads,
>>> +				 int max_lane_count, int max_link_rate,
>>> +				 int conn_base_id);
>>>  
>>>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
>>>  
>>> @@ -831,17 +848,28 @@ int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
>>>  
>>>  int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
>>>  
>>> +bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>> +			      struct drm_dp_mst_port *port, int pbn, int slots);
>>> +
>>> +int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>>> +
>>> +
>>> +void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>>> +
>>>  void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
>>>  
>>> -int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_dp_mst_topology_state *mst_state,
>>> -			     struct drm_dp_mst_atomic_payload *payload);
>>> -int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_atomic_state *state,
>>> -			     struct drm_dp_mst_atomic_payload *payload);
>>> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
>>> -			   struct drm_dp_mst_topology_state *mst_state,
>>> -			   struct drm_dp_mst_atomic_payload *payload);
>>> +void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>>> +				struct drm_dp_mst_port *port);
>>> +
>>> +
>>> +int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>>> +			   int pbn);
>>> +
>>> +
>>> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot);
>>> +
>>> +
>>> +int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);
>>>  
>>>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
>>>  
>>> @@ -863,22 +891,17 @@ int drm_dp_mst_connector_late_register(struct drm_connector *connector,
>>>  void drm_dp_mst_connector_early_unregister(struct drm_connector *connector,
>>>  					   struct drm_dp_mst_port *port);
>>>  
>>> -struct drm_dp_mst_topology_state *
>>> -drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
>>> -				  struct drm_dp_mst_topology_mgr *mgr);
>>> -struct drm_dp_mst_topology_state *
>>> -drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
>>> -				      struct drm_dp_mst_topology_mgr *mgr);
>>> -struct drm_dp_mst_atomic_payload *
>>> -drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
>>> -				 struct drm_dp_mst_port *port);
>>> +struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
>>> +								    struct drm_dp_mst_topology_mgr *mgr);
>>>  int __must_check
>>>  drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>  			      struct drm_dp_mst_topology_mgr *mgr,
>>> -			      struct drm_dp_mst_port *port, int pbn);
>>> +			      struct drm_dp_mst_port *port, int pbn,
>>> +			      int pbn_div);
>>>  int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>>>  				 struct drm_dp_mst_port *port,
>>> -				 int pbn, bool enable);
>>> +				 int pbn, int pbn_div,
>>> +				 bool enable);
>>>  int __must_check
>>>  drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state,
>>>  				  struct drm_dp_mst_topology_mgr *mgr);
>>> @@ -902,12 +925,6 @@ void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
>>>  
>>>  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
>>>  
>>> -static inline struct drm_dp_mst_topology_state *
>>> -to_drm_dp_mst_topology_state(struct drm_private_state *state)
>>> -{
>>> -	return container_of(state, struct drm_dp_mst_topology_state, base);
>>> -}
>>> -
>>>  extern const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs;
>>>  
>>>  /**
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
> 

