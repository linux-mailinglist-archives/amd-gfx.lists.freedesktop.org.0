Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3113716E3C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 May 2023 21:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D83D10E124;
	Tue, 30 May 2023 19:58:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBF110E041;
 Tue, 30 May 2023 19:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFmE/9hLbSmwFgNgTH6Jh7OlX+WtMyKL2HtmITj/ONWcmZmbWn0NUrARWCLy4KMl6BFpLfk+LYP7sL2kpyBISiKRkR9gxQl3c7JSh951/IwOo+W3/Uc8NXhMetA0a6OVtP+7Oz/bFokLxTc1nPEpTvjVqddgep4LYKH70+SpCAJAaMva8LFb+Hgktbr0FzXYHIwSYZO9UDRul3uPo+927FppciTyxfrHT9I15EJX+8LJGyjKRhl6yJPLGlfplF+Zw1icFHaxq1O1qu60Y2mEOhr10BjaPV+XUl9WST5AuC0qLT+8s494K08bNG5w4sTNzfZPdxh2Z2gJW1ddQicEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnuaxoC85x4lH/VXt/RBIplxrQ2JyGCZNZYEhL1O870=;
 b=WziHri0EZQ6gwfOVL15tYQHxlnJMtXd0WbemWBFGNkZvwLsZji9mzN/1WSC6NZhDQRNFlXxLs6vpqG/GFGGxW9vkEHOTfMdvSN4k8eQnXRdDSnmrjFE+Mpy6i9kaUp4UR2DAk4x7YxZ83hayWTVCNsdY2s4YdEH0b0VevOpBix6uE3c7/bIr+rSwXF5v2HHub9nAydfJsk9c27qFhO8+HjnHYcTRwPU57rfqbzPrQKC3UnI8aGDH93kJdks34CyO80YGJhjwD0WIbNEzdI14MCpvCmij0HxegBpeDBK4mUvoqmF0wJbcpWMHMb+veqUdqPnsFQK9OUJUCDlV3OfwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnuaxoC85x4lH/VXt/RBIplxrQ2JyGCZNZYEhL1O870=;
 b=LblzwdqtCmqyxtSi7z7LVcOazNB6pFeWrNKsHqxwJME/Z3PqAvmtgtd8aLbMgDyRj0GiGFKpSoDwwbMVrSkFiWyjwuBiE2qaaD/3NHD8YGBLkGlj7Dgyh2fpEmZvb/sqMquI4YWHs+oTy7O7WpXmnQgvZp+Qd58TdfrGlnHVkmM=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by SA1PR12MB6750.namprd12.prod.outlook.com (2603:10b6:806:257::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:58:32 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::4037:9e51:71d0:1407]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::4037:9e51:71d0:1407%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:58:32 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 14/33] drm/amdgpu: prepare map process for multi-process
 debug devices
Thread-Topic: [PATCH 14/33] drm/amdgpu: prepare map process for multi-process
 debug devices
Thread-Index: AQHZjy5Wsup4lg/LO0GPtrSsTo7Kla9zQwIAgAAAOsA=
Date: Tue, 30 May 2023 19:58:32 +0000
Message-ID: <CY8PR12MB743560CE8C8D3ADD9826C45E854B9@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-14-jonathan.kim@amd.com>
 <59f46943-e1c1-8bbd-e68b-c57cd98e839c@amd.com>
In-Reply-To: <59f46943-e1c1-8bbd-e68b-c57cd98e839c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=042e3fe9-b68c-4ab3-a66d-1f45d2919e5a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-30T19:56:52Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|SA1PR12MB6750:EE_
x-ms-office365-filtering-correlation-id: fe00d3df-39a9-4d8b-c85c-08db61483f26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qN9D3q9kb8ojE2nDyEekEk0I3i18ClqTexYX+BQ00gcP8k780TG+Qk9ce9A+Inc28gUZNMZjtneWr+PpIHoUJZhbO3i2zvCz/8bQJjMPMU4C46n1wLQi6gmATCX1tRaQyA2TAClIXAIjAs+oiRVkiCDLQY+22uzICzbxTUF38FpUPBl8Abg7DvL8hxd17gZ9d0kO0j6aYeeEpF13SVUmvFmwZ4aNNdAIHDMCOl/ig3AnjTanDypS7EJ6WN/kW8Zcz42I0w12XMcWToScFSX50xFuLMg0JS1f8Cmi39CCHXO3JSTuC+fBhhqvBaf+1rBNxOYc7Ss2jXJFZCBhqpsTqQfSSqs6tu9HHYmd42xWlvJuzZZvefAShDCAmOPKcTPL51H1lU69WMJRM2ILJIcFpvQtFTiNNR2U9ZdVGSiWaDMKuRpuRX7V0vrp5vxJ9LVfFxvfjS7XsC9w67skSYu7kp700GrsdRn9i44PkNM0mrtNzuLdIk7DJePutCvf1WUCmRos9L3ADyDEJQSczz5NCTb3dBO1fhmjhGK5wddiTiKlWgl9ofbzgsWNZobQzPHtynf2vCk2vauW5IKql7L5rBXYv8CxHKYZZF4LILHtPMaBMkupB2KOsFYNoC+TD2DA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(38070700005)(86362001)(33656002)(478600001)(66476007)(66446008)(66556008)(110136005)(4326008)(66946007)(76116006)(450100002)(316002)(64756008)(71200400001)(7696005)(55016003)(8676002)(8936002)(41300700001)(5660300002)(2906002)(52536014)(38100700002)(122000001)(26005)(9686003)(6506007)(186003)(83380400001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnRjNG5LQTZNd29uR2RqRWVsUE51L29TRnNyUDliZm4zQllvWGNycjJZSDJX?=
 =?utf-8?B?c1dLYmMzY1BnWi90WWhBdHRyVWkyeEFONFkzN0kyQjE2R2poaWZvU0tuOFQ2?=
 =?utf-8?B?d0dNSDgyRC9STE92ekVZYU9vQWs3UzBVUlVuSnB2RjArNFQ0Y3BrYmpmS1Zu?=
 =?utf-8?B?MHFqQWwreE5zZHllaVhSa2QwNWJMREwwV3M1eHVid2NEY01ISE13TFQ0OWhV?=
 =?utf-8?B?ZnRva2lVK0M1VXNVS3VxWjkyOGlVcWxhVXc1b2RIUHY3TWNEM1FXR01VT254?=
 =?utf-8?B?K09QL094L0t2bVlPT0VaNlozanR4aUlDeWxhL0lmVHhra00xUmRIOVlFUE82?=
 =?utf-8?B?Ym8ycUxyTmFDcEdZZ295UnhDOGliZTRpZmFBZW9KY3ZFTUJnNXR5UVAydVJn?=
 =?utf-8?B?aldwUnJnWW1rR2ZpeHZIU0xSQXpRUTYyR05LUVFkRWo3VUlGN2pLZjZueWVr?=
 =?utf-8?B?UjR1dUszd0NVSUc2QkNzNk9IM2ZueFE0b1lzR2tBOU1JeW1wZGp4TkZuUE9J?=
 =?utf-8?B?Vm1CdGhpRUNlQUdNSVVYbE1aQ21YbmZVYjIveUpEbWdVUGx1Q056dzMvWU8r?=
 =?utf-8?B?aENJZU53V0RoZGYyUytidWhiNUJBR2YzMUp2cUN6YTgrMHM5Vk5mT2NOcGYv?=
 =?utf-8?B?MnRMakdlOGxMOWpUdUVVVjNjQXhlVmJHSnFlZ2szUW9iZWkwZ0RlTDJjdk00?=
 =?utf-8?B?TERvdEUxRzFPd1I0b3YvYWRFWlN4ZHYxSFdVZFhFV1RFVUtjZTNKUi82RFJG?=
 =?utf-8?B?ZC9pOFZ1QkZidkgyTUpBck5aTDdrb2xtcEhwZ1VvVHdSZytjVU9mZ3VCTXNm?=
 =?utf-8?B?OC9aYkpJNnpwSUZKQTV6ZFlBVWZieWovQ3BQZ1l2MjFxNFBsZllSbThZbEZn?=
 =?utf-8?B?R29rd2c2dUE5VnBtMERXNFZIN2tvUEl0cVRwSTczUkQ0c1l1M2FjTlJyNGFQ?=
 =?utf-8?B?U2Z0Y0RIVUsycTRMdVo4UWYvY3NHSW1keTRlNmxLaHAvTGwrSGF6WUphNlFO?=
 =?utf-8?B?ajVvektOVytRZlBtak1kSXVCR1BJWUl5ZXZ5QlJ6Rkw2K09nWlk4RWpoS3Fm?=
 =?utf-8?B?YlYrcVNoZkdjODVwQzNaVlpxRnNHZDBobVN1V2plQ1NDRDBvcDA0a3hPaGpX?=
 =?utf-8?B?Njh6aGhRaFpKeVNRWmVZT0c5TGxtYWpCbXc1SmRCUTJhRlA1bHp0MjNDTkxk?=
 =?utf-8?B?dHVwNnZwNXEyV1FsWXFBWEJOQXhNUE10YXhqSFgwRjl0cHoxQkthY1ZQNk9U?=
 =?utf-8?B?TzN4RDNwalZXaFlTblo5eFR1NVJRdHd3Mm1jb2pFWnNUaUVmZmtGMjlrR0tF?=
 =?utf-8?B?VUExZnBXbzhzQnpiOUhObGE3c2R5Z0l3T1RYVktJVGtVQXpISTg2WHllT29m?=
 =?utf-8?B?cFBySzZXekRYbFNHVVRyTjRReE9HYmpiZEV2M1djbitRTG54M1R6dm1teWJ5?=
 =?utf-8?B?OHJma01acCszTEhRZUZZOC9NNzVmZE8yUUxRcW1UaWo2N0h2TGZRVk05djh4?=
 =?utf-8?B?OGh2b2MvSFh4ZmhJT2dZRW1Oa1V2MFZHRk5UTXkrbnh6WFlrRzZoR1dJY0lj?=
 =?utf-8?B?YU05MGkwYkQ0eHRWVHdvZ3BRd3JZelp6TzcxZk8xeGFzdVdWb1Y0NUg4V2s4?=
 =?utf-8?B?ZmFMODA1bVo0UnlKOUpsVXJzSFQyU2lMODlJYnRkeExsc05nUFlGRFUxOW9j?=
 =?utf-8?B?VFd3YVl4Z2hBaUV2NlVsZlYrZ1VpL1NRcGRtTnBoa2F2UVFqbVp0VFBabjFX?=
 =?utf-8?B?R0VlcVZEQ2lFK3FYQjRLck9UUFlVaVlyVU5WRE5hTzNyRGg0RlA5R1pRQ3Ra?=
 =?utf-8?B?a0RxdVM2Y1FnYmZDYTduYTNPZS9sUXFPNHRvL3RYZ1V6L2ZwMEtoeC8yb0V3?=
 =?utf-8?B?c3hhTFhMRUZVWmk0OXNkbnAyWGpPeENpTWg3OGhRMWRqUXcyVkpmN0JUM2lo?=
 =?utf-8?B?dTVocXJIeC8yTUE2eWJjN0EzSFczOWRiRHhVaGRZTkRtK1FzejFVa1pSK2xU?=
 =?utf-8?B?UW5VWUMwYzczYWc5OEhPUitJdWZMVFRVL3dmWXg5cHNocUFwdlc3TGhmZ3pQ?=
 =?utf-8?B?a0xJSXVaakRraEJvTHc4QjdBV1Z2bWcwZFpvWEpTdHdJbTRFUG9OQ1k2TGVW?=
 =?utf-8?Q?9jUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe00d3df-39a9-4d8b-c85c-08db61483f26
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 19:58:32.7706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anP0f58AWWjv8mWerYwGR+YxOUifODGVfPzqSG8FZv/vVbtVbisTBDDqqx46ogQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6750
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
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLdWVobGlu
ZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAz
MCwgMjAyMyAzOjU2IFBNDQo+IFRvOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNv
bT47IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogSHVhbmcsIEppbkh1aUVyaWMgPEppbkh1aUVyaWMuSHVhbmdA
YW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxNC8zM10gZHJtL2FtZGdwdTogcHJlcGFy
ZSBtYXAgcHJvY2VzcyBmb3IgbXVsdGktDQo+IHByb2Nlc3MgZGVidWcgZGV2aWNlcw0KPg0KPiBB
bSAyMDIzLTA1LTI1IHVtIDEzOjI3IHNjaHJpZWIgSm9uYXRoYW4gS2ltOg0KPiA+IFVubGlrZSBz
aW5nbGUgcHJvY2VzcyBkZWJ1ZyBkZXZpY2VzLCBtdWx0aS1wcm9jZXNzIGRlYnVnIGRldmljZXMg
YWxsb3cNCj4gPiBkZWJ1ZyBtb2RlIHNldHRpbmcgcGVyLVZNSUQgKG5vbi1kZXZpY2UtZ2xvYmFs
KS4NCj4gPg0KPiA+IEJlY2F1c2UgdGhlIEhXUyBtYW5hZ2VzIFBBU0lELVZNSUQgbWFwcGluZywg
dGhlIG5ldyBNQVBfUFJPQ0VTUw0KPiBBUEkgYWxsb3dzDQo+ID4gdGhlIEtGRCB0byBmb3J3YXJk
IHRoZSByZXF1aXJlZCBTUEkgZGVidWcgcmVnaXN0ZXIgd3JpdGUgcmVxdWVzdHMuDQo+ID4NCj4g
PiBUbyByZXF1ZXN0IGEgbmV3IGRlYnVnIG1vZGUgc2V0dGluZyBjaGFuZ2UsIHRoZSBLRkQgbXVz
dCBiZSBhYmxlIHRvDQo+ID4gcHJlZW1wdCBhbGwgcXVldWVzIHRoZW4gcmVtYXAgYWxsIHF1ZXVl
cyB3aXRoIHRoZXNlIG5ldyBzZXR0aW5nDQo+ID4gcmVxdWVzdHMgZm9yIE1BUF9QUk9DRVNTIHRv
IHRha2UgZWZmZWN0Lg0KPiA+DQo+ID4gTm90ZSB0aGF0IGJ5IGRlZmF1bHQsIHRyYXAgZW5hYmxl
bWVudCBpbiBub24tZGVidWcgbW9kZSBtdXN0IGJlDQo+IGRpc2FibGVkDQo+ID4gZm9yIHBlcmZv
cm1hbmNlIHJlYXNvbnMgZm9yIG11bHRpLXByb2Nlc3MgZGVidWcgZGV2aWNlcyBkdWUgdG8gc2V0
dXANCj4gPiBvdmVyaGVhZCBpbiBGVy4NCj4gPg0KPiA+IHYyOiBzcG90IGZpeHVwIG5ldyBrZmRf
bm9kZSByZWZlcmVuY2VzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPGpv
bmF0aGFuLmtpbUBhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RlYnVnLmggICAgICAgIHwgIDUgKysNCj4gPiAgIC4uLi9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDUxDQo+ICsrKysrKysrKysrKysrKysrKysN
Cj4gPiAgIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCB8ICAz
ICsrDQo+ID4gICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyX3Y5LmMgICAg
fCAxNCArKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAg
ICAgICAgIHwgIDkgKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3By
b2Nlc3MuYyAgICAgIHwgIDUgKysNCj4gPiAgIDYgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9u
cygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZWJ1Zy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnLmgNCj4g
PiBpbmRleCBhOGFiZmUyYTBhMTQuLmRiNmQ3MmU3OTMwZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWcuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZWJ1Zy5oDQo+ID4gQEAgLTI5LDQgKzI5LDkgQEAgaW50IGtm
ZF9kYmdfdHJhcF9kaXNhYmxlKHN0cnVjdCBrZmRfcHJvY2VzcyAqdGFyZ2V0KTsNCj4gPiAgIGlu
dCBrZmRfZGJnX3RyYXBfZW5hYmxlKHN0cnVjdCBrZmRfcHJvY2VzcyAqdGFyZ2V0LCB1aW50MzJf
dCBmZCwNCj4gPiAgICAgICAgICAgICAgICAgICAgIHZvaWQgX191c2VyICpydW50aW1lX2luZm8s
DQo+ID4gICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqcnVudGltZV9pbmZvX3NpemUpOw0K
PiA+ICtzdGF0aWMgaW5saW5lIGJvb2wga2ZkX2RiZ19pc19wZXJfdm1pZF9zdXBwb3J0ZWQoc3Ry
dWN0IGtmZF9ub2RlICpkZXYpDQo+ID4gK3sNCj4gPiArICAgcmV0dXJuIEtGRF9HQ19WRVJTSU9O
KGRldikgPT0gSVBfVkVSU0lPTig5LCA0LCAyKTsNCj4NCj4gVGhpcyBuZWVkcyB0byBiZSB1cGRh
dGVkIHRvIGluY2x1ZGUgOS40LjMgYXMgd2VsbC4gSXMgdGhhdCBjb21pbmcgaW4gYQ0KPiBkaWZm
ZXJlbnQgcGF0Y2g/IE90aGVyIHRoYW4gdGhhdCwgdGhpcyBwYXRjaCBpcw0KDQpUaGF0J3MgY29y
cmVjdC4gIFRoaXMgc2VyaWVzIGRvZXMgbm90IGVuYWJsZSB0aGUgZGVidWdnZXIgZm9yIEdGWDku
NC4zLg0KVGhpcyB3aWxsIGJlIGEgZm9sbG93LXVwIHNlcmllcyB0aGF0IEVyaWMgd2lsbCBwcm92
aWRlLg0KDQpUaGFua3MuDQoNCkpvbg0KDQo+DQo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4NCj4NCj4gPiArfQ0KPiA+ICsNCj4gPiAgICNl
bmRpZg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ID4gaW5kZXggYzg1MTlhZGM4OWFjLi5iYWRmZTEyMTBi
YzQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiA+IEBAIC0zNiw2ICszNiw3IEBADQo+ID4gICAj
aW5jbHVkZSAia2ZkX2tlcm5lbF9xdWV1ZS5oIg0KPiA+ICAgI2luY2x1ZGUgImFtZGdwdV9hbWRr
ZmQuaCINCj4gPiAgICNpbmNsdWRlICJtZXNfYXBpX2RlZi5oIg0KPiA+ICsjaW5jbHVkZSAia2Zk
X2RlYnVnLmgiDQo+ID4NCj4gPiAgIC8qIFNpemUgb2YgdGhlIHBlci1waXBlIEVPUCBxdWV1ZSAq
Lw0KPiA+ICAgI2RlZmluZSBDSUtfSFBEX0VPUF9CWVRFU19MT0cyIDExDQo+ID4gQEAgLTI1OTMs
NiArMjU5NCw1NiBAQCBpbnQgcmVsZWFzZV9kZWJ1Z190cmFwX3ZtaWQoc3RydWN0DQo+IGRldmlj
ZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ID4gICAgIHJldHVybiByOw0KPiA+ICAgfQ0KPiA+DQo+
ID4gK2ludCBkZWJ1Z19sb2NrX2FuZF91bm1hcChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSkNCj4gPiArew0KPiA+ICsgICBpbnQgcjsNCj4gPiArDQo+ID4gKyAgIGlmIChkcW0tPnNj
aGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05PX0hXUykgew0KPiA+ICsgICAgICAgICAg
IHByX2VycigiVW5zdXBwb3J0ZWQgb24gc2NoZWRfcG9saWN5OiAlaVxuIiwgZHFtLQ0KPiA+c2No
ZWRfcG9saWN5KTsNCj4gPiArICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgfQ0K
PiA+ICsNCj4gPiArICAgaWYgKCFrZmRfZGJnX2lzX3Blcl92bWlkX3N1cHBvcnRlZChkcW0tPmRl
dikpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICBkcW1fbG9jayhk
cW0pOw0KPiA+ICsNCj4gPiArICAgciA9IHVubWFwX3F1ZXVlc19jcHNjaChkcW0sDQo+IEtGRF9V
Tk1BUF9RVUVVRVNfRklMVEVSX0FMTF9RVUVVRVMsIDAsIDAsIGZhbHNlKTsNCj4gPiArICAgaWYg
KHIpDQo+ID4gKyAgICAgICAgICAgZHFtX3VubG9jayhkcW0pOw0KPiA+ICsNCj4gPiArICAgcmV0
dXJuIHI7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBkZWJ1Z19tYXBfYW5kX3VubG9jayhzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4gPiArew0KPiA+ICsgICBpbnQgcjsNCj4g
PiArDQo+ID4gKyAgIGlmIChkcW0tPnNjaGVkX3BvbGljeSA9PSBLRkRfU0NIRURfUE9MSUNZX05P
X0hXUykgew0KPiA+ICsgICAgICAgICAgIHByX2VycigiVW5zdXBwb3J0ZWQgb24gc2NoZWRfcG9s
aWN5OiAlaVxuIiwgZHFtLQ0KPiA+c2NoZWRfcG9saWN5KTsNCj4gPiArICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4gPiArICAgfQ0KPiA+ICsNCj4gPiArICAgaWYgKCFrZmRfZGJnX2lzX3Bl
cl92bWlkX3N1cHBvcnRlZChkcW0tPmRldikpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIDA7DQo+
ID4gKw0KPiA+ICsgICByID0gbWFwX3F1ZXVlc19jcHNjaChkcW0pOw0KPiA+ICsNCj4gPiArICAg
ZHFtX3VubG9jayhkcW0pOw0KPiA+ICsNCj4gPiArICAgcmV0dXJuIHI7DQo+ID4gK30NCj4gPiAr
DQo+ID4gK2ludCBkZWJ1Z19yZWZyZXNoX3J1bmxpc3Qoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5h
Z2VyICpkcW0pDQo+ID4gK3sNCj4gPiArICAgaW50IHIgPSBkZWJ1Z19sb2NrX2FuZF91bm1hcChk
cW0pOw0KPiA+ICsNCj4gPiArICAgaWYgKHIpDQo+ID4gKyAgICAgICAgICAgcmV0dXJuIHI7DQo+
ID4gKw0KPiA+ICsgICByZXR1cm4gZGVidWdfbWFwX2FuZF91bmxvY2soZHFtKTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgICNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykNCj4gPg0KPiA+ICAgc3Rh
dGljIHZvaWQgc2VxX3JlZ19kdW1wKHN0cnVjdCBzZXFfZmlsZSAqbSwNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
aA0KPiA+IGluZGV4IGJmN2FhM2Y4NDE4Mi4uYmI3NWQ5MzcxMmViIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmgNCj4gPiBAQCAtMjkwLDYgKzI5MCw5IEBAIGludCByZXNlcnZlX2RlYnVnX3RyYXBfdm1p
ZChzdHJ1Y3QNCj4gZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFwZCk7DQo+ID4gICBpbnQgcmVsZWFz
ZV9kZWJ1Z190cmFwX3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ID4g
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQpOw0KPiA+
ICtpbnQgZGVidWdfbG9ja19hbmRfdW5tYXAoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpk
cW0pOw0KPiA+ICtpbnQgZGVidWdfbWFwX2FuZF91bmxvY2soc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0pOw0KPiA+ICtpbnQgZGVidWdfcmVmcmVzaF9ydW5saXN0KHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtKTsNCj4gPg0KPiA+ICAgc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgZ2V0X3NoX21lbV9iYXNlc18zMihzdHJ1Y3QNCj4ga2ZkX3Byb2Nlc3NfZGV2aWNlICpw
ZGQpDQo+ID4gICB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wYWNrZXRfbWFuYWdlcl92OS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3BhY2tldF9tYW5hZ2VyX3Y5LmMNCj4gPiBpbmRleCAwZmU3M2RiZDI4YWYuLjI5YTJkMDQ5
OWI2NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFj
a2V0X21hbmFnZXJfdjkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wYWNrZXRfbWFuYWdlcl92OS5jDQo+ID4gQEAgLTg4LDYgKzg4LDEwIEBAIHN0YXRpYyBpbnQg
cG1fbWFwX3Byb2Nlc3NfYWxkZWJhcmFuKHN0cnVjdA0KPiBwYWNrZXRfbWFuYWdlciAqcG0sDQo+
ID4gICB7DQo+ID4gICAgIHN0cnVjdCBwbTRfbWVzX21hcF9wcm9jZXNzX2FsZGViYXJhbiAqcGFj
a2V0Ow0KPiA+ICAgICB1aW50NjRfdCB2bV9wYWdlX3RhYmxlX2Jhc2VfYWRkciA9IHFwZC0+cGFn
ZV90YWJsZV9iYXNlOw0KPiA+ICsgICBzdHJ1Y3Qga2ZkX2RldiAqa2ZkID0gcG0tPmRxbS0+ZGV2
LT5rZmQ7DQo+ID4gKyAgIHN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCA9DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICBjb250YWluZXJfb2YocXBkLCBzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2
aWNlLCBxcGQpOw0KPiA+ICsgICBpbnQgaTsNCj4gPg0KPiA+ICAgICBwYWNrZXQgPSAoc3RydWN0
IHBtNF9tZXNfbWFwX3Byb2Nlc3NfYWxkZWJhcmFuICopYnVmZmVyOw0KPiA+ICAgICBtZW1zZXQo
YnVmZmVyLCAwLCBzaXplb2Yoc3RydWN0IHBtNF9tZXNfbWFwX3Byb2Nlc3NfYWxkZWJhcmFuKSk7
DQo+ID4gQEAgLTEwMiw2ICsxMDYsMTYgQEAgc3RhdGljIGludCBwbV9tYXBfcHJvY2Vzc19hbGRl
YmFyYW4oc3RydWN0DQo+IHBhY2tldF9tYW5hZ2VyICpwbSwNCj4gPiAgICAgcGFja2V0LT5iaXRm
aWVsZHMxNC5udW1fb2FjID0gcXBkLT5udW1fb2FjOw0KPiA+ICAgICBwYWNrZXQtPmJpdGZpZWxk
czE0LnNkbWFfZW5hYmxlID0gMTsNCj4gPiAgICAgcGFja2V0LT5iaXRmaWVsZHMxNC5udW1fcXVl
dWVzID0gKHFwZC0+aXNfZGVidWcpID8gMCA6IHFwZC0NCj4gPnF1ZXVlX2NvdW50Ow0KPiA+ICsg
ICBwYWNrZXQtPnNwaV9nZGJnX3Blcl92bWlkX2NudGwgPSBwZGQtPnNwaV9kYmdfb3ZlcnJpZGUg
fA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRkLT5z
cGlfZGJnX2xhdW5jaF9tb2RlOw0KPiA+ICsNCj4gPiArICAgaWYgKHBkZC0+cHJvY2Vzcy0+ZGVi
dWdfdHJhcF9lbmFibGVkKSB7DQo+ID4gKyAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGtmZC0+
ZGV2aWNlX2luZm8ubnVtX29mX3dhdGNoX3BvaW50czsgaSsrKQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgcGFja2V0LT50Y3Bfd2F0Y2hfY250bFtpXSA9IHBkZC0+d2F0Y2hfcG9pbnRzW2ldOw0K
PiA+ICsNCj4gPiArICAgICAgICAgICBwYWNrZXQtPmJpdGZpZWxkczIuc2luZ2xlX21lbW9wcyA9
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICEhKHBkZC0+cHJvY2Vzcy0+ZGJnX2Zs
YWdzICYNCj4gS0ZEX0RCR19UUkFQX0ZMQUdfU0lOR0xFX01FTV9PUCk7DQo+ID4gKyAgIH0NCj4g
Pg0KPiA+ICAgICBwYWNrZXQtPnNoX21lbV9jb25maWcgPSBxcGQtPnNoX21lbV9jb25maWc7DQo+
ID4gICAgIHBhY2tldC0+c2hfbWVtX2Jhc2VzID0gcXBkLT5zaF9tZW1fYmFzZXM7DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+ID4gaW5kZXggNGM5MTJiNzczNWI1
Li44ZmNhNzE3NWRhYWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cml2LmgNCj4gPiBAQCAtODE2LDYgKzgxNiwxMiBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNl
IHsNCj4gPiAgICAgdWludDY0X3QgZmF1bHRzOw0KPiA+ICAgICB1aW50NjRfdCBwYWdlX2luOw0K
PiA+ICAgICB1aW50NjRfdCBwYWdlX291dDsNCj4gPiArDQo+ID4gKyAgIC8qIFRyYWNrcyBkZWJ1
ZyBwZXItdm1pZCByZXF1ZXN0IHNldHRpbmdzICovDQo+ID4gKyAgIHVpbnQzMl90IHNwaV9kYmdf
b3ZlcnJpZGU7DQo+ID4gKyAgIHVpbnQzMl90IHNwaV9kYmdfbGF1bmNoX21vZGU7DQo+ID4gKyAg
IHVpbnQzMl90IHdhdGNoX3BvaW50c1s0XTsNCj4gPiArDQo+ID4gICAgIC8qDQo+ID4gICAgICAq
IElmIHRoaXMgcHJvY2VzcyBoYXMgYmVlbiBjaGVja3BvaW50ZWQgYmVmb3JlLCB0aGVuIHRoZSB1
c2VyDQo+ID4gICAgICAqIGFwcGxpY2F0aW9uIHdpbGwgdXNlIHRoZSBvcmlnaW5hbCBncHVfaWQg
b24gdGhlDQo+ID4gQEAgLTk1Miw2ICs5NTgsOSBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3Mgew0KPiA+
DQo+ID4gICAgIGJvb2wgeG5hY2tfZW5hYmxlZDsNCj4gPg0KPiA+ICsgICAvKiBUcmFja3MgZGVi
dWcgcGVyLXZtaWQgcmVxdWVzdCBmb3IgZGVidWcgZmxhZ3MgKi8NCj4gPiArICAgYm9vbCBkYmdf
ZmxhZ3M7DQo+ID4gKw0KPiA+ICAgICBhdG9taWNfdCBwb2lzb247DQo+ID4gICAgIC8qIFF1ZXVl
cyBhcmUgaW4gcGF1c2VkIHN0YXRlZCBiZWNhdXNlIHdlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZg0K
PiBkb2luZyBhIENSSVUgY2hlY2twb2ludCAqLw0KPiA+ICAgICBib29sIHF1ZXVlc19wYXVzZWQ7
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNz
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jDQo+ID4gaW5k
ZXggZDYzYTc2NGRhZmI5Li4wMjgxZjc5ZmNkN2QgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMNCj4gPiBAQCAtMTYxMiw2ICsxNjEyLDExIEBAIHN0
cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UNCj4gKmtmZF9jcmVhdGVfcHJvY2Vzc19kZXZpY2VfZGF0
YShzdHJ1Y3Qga2ZkX25vZGUgKmRldiwNCj4gPiAgICAgfQ0KPiA+DQo+ID4gICAgIHAtPnBkZHNb
cC0+bl9wZGRzKytdID0gcGRkOw0KPiA+ICsgICBpZiAoa2ZkX2RiZ19pc19wZXJfdm1pZF9zdXBw
b3J0ZWQocGRkLT5kZXYpKQ0KPiA+ICsgICAgICAgICAgIHBkZC0+c3BpX2RiZ19vdmVycmlkZSA9
IHBkZC0+ZGV2LT5rZmQya2dkLQ0KPiA+ZGlzYWJsZV9kZWJ1Z190cmFwKA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGQtPmRldi0+YWRl
diwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZmFsc2UsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDApOw0KPiA+DQo+ID4gICAgIC8qIEluaXQgaWRyIHVzZWQgZm9yIG1lbW9yeSBo
YW5kbGUgdHJhbnNsYXRpb24gKi8NCj4gPiAgICAgaWRyX2luaXQoJnBkZC0+YWxsb2NfaWRyKTsN
Cg==
