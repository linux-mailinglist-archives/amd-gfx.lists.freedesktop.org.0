Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981D4F1CE7
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Apr 2022 23:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC36510E553;
	Mon,  4 Apr 2022 21:35:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC9010E571
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Apr 2022 21:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd/NWYidRwrgle9H/lgOwPQ7H/SkzO+7ozPcZvqlrZ+V6qhbS+XEPFbtksD5f4r6B8HFu4VM4YCq7xdGAtKEuwa8ZhuGWU7ogCDKTttU2PCFljFYwBoqqxBafXcHj5dOki02miCL+o0Is/sd4JE8rVDOqMXuM2Vt/3dpxr6OJ9YNVi4ajOZywHuHLbnR4P84yH0euxDMtYgURBrcgf+CN5bkfxdfDyc/dFxnmPVR1XDKv+5At9QFKVGuc2DH0sg6aOnRTGojHZOSIOgQByIHDd118zKz0TVhdsKek6peuZkaXaS3OLPY6vWd3pFEse8vd3513H8hxC75ljvEndREJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kJZ4h31wmDGZgEswRWu4C3VsUEAmnyJ3f4hJ6WhZSA=;
 b=fK3oURIQroDC0JcXAJDEhLhjrZXLC6lAPgmZ9h2TjGbHYvesGSryVgwdqRkPDwRLh4cNTRZvWKD8byf6GSjkoVXJbJpo+jTNduE323LH7WW/W8qXR1leyOOnMx8kV2PxmD4q5VkJC5zVYQ1eL5ZfNXpVQ/bkq4yYvKmDd1mR8RlPPoIgsNndM/PARf7DkM7RSpHn1U5cWmvniuXMg/VNW1pC1SQ1JHasVEj6wQXcZhrp939nwu/yrjbk+gUfiIT8m2EDMjMNPgczUaaTjBWP2Tof8DSVrTOMPQRXYtDGhrrr7ysaQHHNVhKnJeuEdIFj5JRkeOmSxsbUcw3CZ9g16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kJZ4h31wmDGZgEswRWu4C3VsUEAmnyJ3f4hJ6WhZSA=;
 b=EM6rE/bzp+H+p3y+41wfrjj0HVZuxAB9dwvPR3RNCYklXJY4av78n5Rwtwgb6BR/J7IJ7uoi5KhLhd96lQYwJiypW4IcBkUL7nG8PlAVIE8YM0Po3EECA/NWb6dX5JybTJC7Blc25M6+X/1xzY6cRQg6XKkmSDhJB+eHuKArq/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by BYAPR12MB2630.namprd12.prod.outlook.com (2603:10b6:a03:67::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 21:35:31 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::a199:80cc:7764:a069]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::a199:80cc:7764:a069%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 21:35:30 +0000
Message-ID: <fdcf97cb-5384-c286-61b2-2ddabba857c3@amd.com>
Date: Mon, 4 Apr 2022 17:35:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm/amdgpu: Flush TLB after mapping for VG20+XGMI
Content-Language: en-US
To: =?UTF-8?Q?Tomasz_Mo=c5=84?= <desowin@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20220401195726.21436-1-Philip.Yang@amd.com>
 <3fce21b7-f1a0-28db-5322-6eb89a10fe8d@gmail.com>
 <CADnq5_Mh+auV8yNSqAet-zsC8WC+8=NZWmsbg-uON_166bJ8gg@mail.gmail.com>
 <b90412bbea1439a614badede2450316099dd08e6.camel@gmail.com>
From: philip yang <yangp@amd.com>
In-Reply-To: <b90412bbea1439a614badede2450316099dd08e6.camel@gmail.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::18) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f95852d-2628-4720-a539-08da16830af9
X-MS-TrafficTypeDiagnostic: BYAPR12MB2630:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2630E1237EDD97A810F38447E6E59@BYAPR12MB2630.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRhVO63uWiVFRVe9HJ460UK5A3z3Mtng/egvAgOS+bC4A0wD19ZyazCEQArwsEKFN2gjwcyvWSg4MsbpE0EssQErLCmNPOGTj3/sroHOzcvaqbJ7d+Lk0dGbh6kKxUWtZGTklclpHajt1/m68JaEGPgHO73bKQ2NQCXrli2eUgpj2hJjTA9ELtRRlRUeuzHtDcRyZSWx9oPeKmEKZ2f/rB3W1E9u2Y+iJ5EdpTQlBK1l+gJHlfdFv+7NcCDVZQc0oOWydOHb0j3Nr4R6RfvNOu6nEh23yU8qsQWHvcEndMP6ZPVZEnJsYNz+s/eJD0tf8whrbDLyMmZrMAJQa7lb82jnMpRwpe1+qRzAbN3JljIE43Dh6QgRtouIIXj557BfvQtWzdphq4plpVz9Mspy70jbLI9s23813ZBii5PiS25aL++qmbJLofK8hyfh2sDPF9I3mOYe4JIMGRf0mW1ivKMJ2qZxjr5PASXAgOSSUc+bFV+VTaSKZ/y/8fFhkzKNTUY+7gVtX4B0e9rUqe+mMqRa6VVFImxqNQFbTmfE2Eu4c75Y1tqujArI3WHzJHHxFZhih4B0I4G3PZasmYsvjTpuzXz9p1muKrn8rZ7zdKoqUHed+itzmTRxiKt8js2mzME/IRDAuLskLLirOoXbkEkMl32vRKr7i/D4HQM3oc3p3/lI9yBFauUTh6n3U2dqIEap6OL2YnGYvRtBGQukZzJ8wA13hwOp1fRadJaV/qY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66476007)(66556008)(316002)(8676002)(110136005)(54906003)(2616005)(45080400002)(31696002)(166002)(6512007)(4326008)(6506007)(53546011)(8936002)(508600001)(38100700002)(6486002)(83380400001)(966005)(2906002)(36756003)(31686004)(186003)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkRUWXZHQkNjSU5veURSaTZBT1pWQkRDS2pWVHltNytDb05kSng5MGdGKzJp?=
 =?utf-8?B?V0RkSmd2UHVJNDluVUJmei81TWR4b1EyNmRDRERkc3B6YzNYdldGUHhnYUV6?=
 =?utf-8?B?bUVYbjgwOGpudGo4OG1xd0ZaNGhSVkQ5UC9lUVlVOC9tUEZwTjJxNkFMa2tZ?=
 =?utf-8?B?VzNEY2MxVExvekI5TXQyRkpmU29HT01RSDFObi9CaUtRZGFlSUdaMkZTd3BU?=
 =?utf-8?B?eG9QbmVjbzduano4Zlh1VmFRVnhtUC9LOS80U2lnZElSRzJsR2Vsd3pxYlpi?=
 =?utf-8?B?dlp1ZVRNYVRaTGJ2THI3cjNza3ppclJiRmVMeU1xKzlITHgvMkJsZlRUSndv?=
 =?utf-8?B?MERLbWQ1ejF6NUpydnRyZUF3d1JzREFMNnZRQWpoaVhXR1F3c3R3VzhqcURS?=
 =?utf-8?B?bTVqTVVmVlZLaFBUOUZWSTZNY2NtbUpVLzQzcVFNSkpxanBtb24xbW9GMWx6?=
 =?utf-8?B?N3hRbjdTMW41UTU3UXdHdDRJUXRicUdvS3BJT2dyU2NiV08zc0x0bVFhUmJs?=
 =?utf-8?B?Zjh4ZWo2c3lsNDhvWmhaRjZ4eENwQ3NwUXVJdXRPdjRyejZlL29rNGlLRUlY?=
 =?utf-8?B?TnRkQjdPSXd4ckNQandVbDJXQXgrR2pubUtIRmZ1OWZNN3JpT21VTWNQZmlW?=
 =?utf-8?B?bjZ1Ymw0a2xkZlBYbW9kU3VBbXBLZ2xBZDhWQzk0YlFTRTFZL050OXdkZXJE?=
 =?utf-8?B?SFNYQWdpK0c0cEpROGxVS3VrNnlnTTdiTFhiVTBLbXFwYnE0Y2JqeWdKdVJ3?=
 =?utf-8?B?cUZuZlZjRGsvSlJSNHdSRllpZlpXekpiWkR6UWRHR2JwbnN4b3VYUVBON2tj?=
 =?utf-8?B?VktTMEhZcmZmeUtaaStXQ3B4RzhtN1I0Q3hsOEppbGlyZTJMU2p5a1JzalZa?=
 =?utf-8?B?NFphT0tiQksvcjRyNjE3SysyZVBnS3FxNThBZjU3NldyWkRENGJMcjZyV2s4?=
 =?utf-8?B?MnNLNDViK1dvWmFsSXFwdEEreDI4RUJVWnpCVmpqT2Vkck96a1dMU2dmcFk4?=
 =?utf-8?B?WVZHNmYyMEI5T09EUjFmYk4yRzJ5cmNqL2RlT05INFZLSlFaTlJkNXhKcjFP?=
 =?utf-8?B?MkJ4Tkp0VFU4dzlLQkd2QjVrZWxZa3BNQkVuZ1l5MHA5UXI3cXBETGZBRHV1?=
 =?utf-8?B?dUlGZ1d0V3pyL3YyVlpwNCs3c2ozbnBXT2puazVRaW9CL3VBWi9PT3FOWmN3?=
 =?utf-8?B?dE9YME5FSStJZEdib1BOUllubU5ad092WFFxa3RGWUZJaFFpbGhQeUk3eFF2?=
 =?utf-8?B?RlUxaU1pV3FZL1IvSThWcHkwaDVyL1VpMTlHRW5sbUhOZVEwbUkrbHhxVFhD?=
 =?utf-8?B?SFJZRjRzOFpTR1ZRdlFZQ0NDUmxyb1VCNS9VVjdiYWF1Smlqd1dSakNMZVFV?=
 =?utf-8?B?cHVUWkZ2RVVUV1BLT2RqSnRLU1dLc0hkV2xzUWxEQXFZcjd1TVpBVVdMbWty?=
 =?utf-8?B?Q1JJWS8rbThyMEcxcmk0aG1EbGZoeWxMNjZqMFZiV1R6RGkzeWwzWEZJVFRS?=
 =?utf-8?B?ek8vTXpjbUM0YUljbFRreldqYVE4T3d4RllhRUVtVGw3My9abEMyd21OVXZz?=
 =?utf-8?B?MTZxVWFBZDdSU1ovYVlGVXVnRUtMTTY2Y2tOVWFaNEpaeDREelJ1T3kydWQw?=
 =?utf-8?B?MW1OMVh3R1VoekJRVEtKdS9Vc2Y1VUJxVUNMUDc1N3JrZnVwZnBQc05qOTd6?=
 =?utf-8?B?RG83VHRxRzV6ZzU4N3VHVE9tWE85QW1YZUpuYXFDL1hCd3d3cmhUbEtpYXpm?=
 =?utf-8?B?ejhSalp3QWF6UnFPbmR2aVlRQnBYWU43Qzc2ZUNWSEFrTEdtbTM0MVliQS8v?=
 =?utf-8?B?VVlJazlrR3oyMGNWRnNNSGJlWkxaVWNNM2lHL2dSTTkydkttby95VTBnNVlH?=
 =?utf-8?B?Q2JuSXpqNC92QmJsMEdoeFZocC94cVhaeDl0YVdxSVNlS1A3VmlablcrYi9Y?=
 =?utf-8?B?OHM5M25HbHJBMVNZeEVHaWY0Q1VuVTcwYnVjVXlkbjdQdlZqZWUyRWgrSnZt?=
 =?utf-8?B?d1ZaUzFsRW5nWGRVcUd1MWYxMW1NZjE3YTdsUWZYYUovSkNBV0gvdVhVa0NX?=
 =?utf-8?B?dStYcmFhMjRXZ0M0TDdPL1dxYldTRWlnV1dwc0locVMyNHRtbE9XWklvZHNi?=
 =?utf-8?B?cG9jdnNoMHE2VXhGcXMxQ25RQVM1RTlxYTFWRys1RlNuMFBEMElvcFA0Zk1W?=
 =?utf-8?B?eFlFL0pBSkxuLzB3YzdRSlI0enFsUTV3dHUxZ0hwc1RDVmhtRmc0Rmd1QUF2?=
 =?utf-8?B?N2FlVFhUbkxCUTJNK1dWMnE0MGZoaTRPcWJzN091ZC9Qem9hczNVUlFiYVNF?=
 =?utf-8?B?MEVORzRPQnl5Z2lnYlBMT3p6Vk10ZDRZZ1hPU1AzWExsNmZoNmZ4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f95852d-2628-4720-a539-08da16830af9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 21:35:30.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gne6TCl0Vdf/PoEA0JNYege6xzadH0FFaTcBMUpFMQM4UH6LP/Btap3VGKpMIglA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2630
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
Cc: Philip Yang <Philip.Yang@amd.com>, "Kuehling,
 Felix" <felix.kuehling@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-04-04 15:46, Tomasz Moń wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b90412bbea1439a614badede2450316099dd08e6.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2022-04-04 at 15:18 -0400, Alex Deucher wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, Apr 4, 2022 at 3:03 PM Tomasz Moń <a class="moz-txt-link-rfc2396E" href="mailto:desowin@gmail.com">&lt;desowin@gmail.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On top of what commit does this work?

It does not apply at top of v5.18-rc1.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This is stuff for drm-next
(<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommits%2Fdrm-next&amp;amp;data=04%7C01%7CPhilip.Yang%40amd.com%7C7ecebd09a0af4734337608da1673c38d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637846984292244281%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=uNP0Qmv%2BI25FAY0UVMIJ5BM9CiPSMwbmylEMCXkTJac%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommits%2Fdrm-next&amp;amp;data=04%7C01%7CPhilip.Yang%40amd.com%7C7ecebd09a0af4734337608da1673c38d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637846984292244281%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=uNP0Qmv%2BI25FAY0UVMIJ5BM9CiPSMwbmylEMCXkTJac%3D&amp;amp;reserved=0</a>).
E.g., 5.19.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This does not compile on current drm-next, just like I noted in the
next paragraph of my email.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">It does apply, but fails to compile, on top of &quot;drm/amdkfd: Create
file
descriptor after client is added to smi_clients list&quot; that is
commit:
&nbsp;&nbsp; * cbe879c87245ce6272afe6456dbc8ce2c8f38d64 in amd-staging-drm-
next
&nbsp;&nbsp; * e45422695c196dbc665a95526c85ff4b8752aff2 in drm-next
fetched from <a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux.git&amp;amp;data=04%7C01%7CPhilip.Yang%40amd.com%7C7ecebd09a0af4734337608da1673c38d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637846984292244281%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=XoXSbmW4oME2qfbBR%2F%2ByTfyoRpL6Ro6C%2BRYekQcQaHk%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux.git&amp;amp;data=04%7C01%7CPhilip.Yang%40amd.com%7C7ecebd09a0af4734337608da1673c38d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637846984292244281%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=XoXSbmW4oME2qfbBR%2F%2ByTfyoRpL6Ro6C%2BRYekQcQaHk%3D&amp;amp;reserved=0</a>

The compile error is due to flush_tlb being undeclared.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: In function ‘amdgpu_vm_bo_update_mapping’:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:845:9: error: ‘flush_tlb’ undeclared (first use in this function); did you mean ‘kfd_flush_tlb’?
  845 |         flush_tlb |= (adev-&gt;gmc.xgmi.num_physical_nodes &amp;&amp;
      |         ^~~~~~~~~
      |         kfd_flush_tlb
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:845:9: note: each undeclared identifier is reported only once for each function it appears in
</pre>
    </blockquote>
    <p>This must be applied after patch &quot;drm/amdgpu: fix TLB flushing
      during eviction&quot;, which adds local variable flush_tlb.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:b90412bbea1439a614badede2450316099dd08e6.camel@gmail.com">
      <pre class="moz-quote-pre" wrap="">
Best Regards,
Tomasz Mon
</pre>
    </blockquote>
  </body>
</html>
