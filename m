Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD884A056
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Feb 2024 18:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E09F10FAFE;
	Mon,  5 Feb 2024 17:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K/a/eObj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41A10FAFC
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Feb 2024 17:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTKS4IxXEXE54LowACdkfsivkk9mkO6U1hpBNf5hCUAd2EkdPvzM69wIVq698PSKHpua5Y2NxnSqt9o2c13FHrImoSx05r+PcPBApphcCQbcvQ8zjrXlBAXiI5OGt/d9dkZKO0Ski/YjTrMZmFf5JCwAgHyaIRNb9Y2A2d6MF1ieEivGxRT9mJbU4Y1pbK9ZbNtPSgm0hANQCOSN39guLZ6+FG5+KqpeOgbsOyFjFQUCbrjkdIU3e2D45uORCWQ4t9eLMd70uc4cw5R0KHRwIIZqKW/NJm0KKTbuXttaLe37iNVUBPxNlrBz54QQFyBFxtw8SKYjgpope+OM1FmpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL5jdarD4wftipmT4xMdvmE+gcUIa8PRAptp6JCgJCM=;
 b=mEnnvKXGjrai+URlcyeNl9z5epnnK4yOQYxGPjmZiNXeHsCj8UWWs5ZaYg1sqLtKZT4cLvmTZvwhf6tdZhg1e+iIu4VmU5JroeqFJ8/FsdbMh0xMx9o2o9fPqv5w05yQYIsIy2vlQ9V/ntqf/dsp/IxQpSXScMkvBSMJE/PYnoAFWlKvr5VscKPvSr/IwT3OxRYXHDkqSwtb5KXuDqBJ6F2r1g01TNMZxcjT6i7LouBP+k6IvsEmEckN3EvyhAEeTmD1yxv19CidGeSLZCYcGYQvBPbKJAPkErP4Yk6c/JfFj+YSHSUxwZ6R1p2I7En3fLVMI/lTeBG+AOfTdfv8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL5jdarD4wftipmT4xMdvmE+gcUIa8PRAptp6JCgJCM=;
 b=K/a/eObjwJF/lp8awq2LQr1TRfot2ibaDBRxd4o1dMUAXiypTmbGo7ElK3uRO793mQvrXA3UF9c6hwfGvcokF37S8izEek+orKeDoAzXgBGmK76lwodkZuPhD5rijllfRxSsc595bJa3S172k6mR2M3rE2U4M+BxOHlZmechrZc=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SJ0PR12MB5407.namprd12.prod.outlook.com (2603:10b6:a03:3ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Mon, 5 Feb
 2024 17:12:27 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::9288:f78d:b34e:9b52]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::9288:f78d:b34e:9b52%7]) with mapi id 15.20.7270.016; Mon, 5 Feb 2024
 17:12:27 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Shengyu Qu <wiagn233@outlook.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Cornwall, Jay" <Jay.Cornwall@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>
Subject: RE: drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole (v2)
Thread-Topic: drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole (v2)
Thread-Index: AQHaUsK8ygW1auIs9Uub4VJA+S6e6rDxERcrgAeMlQCAA2hYYA==
Date: Mon, 5 Feb 2024 17:12:27 +0000
Message-ID: <BL1PR12MB51447B5CC481DFBA3F197126F7472@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240125222748.2089791-1-felix.kuehling@amd.com>
 <5b23b3ef-2ccf-430e-bc0b-b4868358ad8f@outlook.com>
 <TY3P286MB2611C443C88FFC125AE79DA2987E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <8b8d9a37-111e-4c92-886d-f29da2abb527@amd.com>
 <TY3P286MB2611E17DA5FCC50F6FEC83BB987E2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <d180e65f-7b3e-4413-baad-e40c3bb63fce@amd.com>
 <TY3P286MB2611781B20F3953AAD2FC38E98412@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TY3P286MB2611781B20F3953AAD2FC38E98412@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=7be6d087-1e8f-42c0-aa37-8843200caa3e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-02-05T17:08:11Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SJ0PR12MB5407:EE_
x-ms-office365-filtering-correlation-id: f5c18389-14c4-4ba2-0098-08dc266da115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 478bqpYx+scs8VhD+FVlOH1j6AS3BVuU5X6FKtib640VxUlvPeTSum9Sv/E1dQ8PlaKuXu2orFEr7qhVif4Tsm7alPTO+H/Tq9SHumPs5HU55fARoaMELHSXPsBI/D0+3FGTuRhvScQ4mg5qxr91C6JFp3qZF9j+sjDc4brPV69DQmYvyWP1s7MS200AFfSftal1N0OncCt+jrSzFwQLKU2OWbmabFwAVkWg08+ghI/e9I1/Att3jpid0JTCa291gaKeDUKOOb6J+egTDMK+I+XEmuX5t84rDXLSJbw6YtXj/SCMzMX002d4aCXL+e3Ivv8qIoka7nh+Hciw1F6vcs6v5dTPOX45MXASaP7v71Y890eAc+6OdDHsS5UK+OR1P30dG2afZrAp2GZS4WD3dT5TcrGzMalTJFo8BPwIRQDr3hO8w/UEjB72s9WQ6AufQGyKuhOZ9q7FKecAkhpZ/t1UQRJ1mg5l82a4Mfhl7cq/DCdBVM4U+/8YE99D3t4UxWmhFeZIoZd75eJCA90WrVcIGTXIfmesBrRT8Fkj7WfkZaekz9QvErr5CveT9LXf0OTmWBvXduONnYnlKSDtqxiydso6X5GNirnyjzT3GQGRxPKFGPrzKgQr3DOAqXnucq1e0WQcVBsxP0G7oHbgnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(41300700001)(33656002)(478600001)(45080400002)(53546011)(9686003)(966005)(38070700009)(86362001)(26005)(83380400001)(30864003)(66556008)(5660300002)(71200400001)(66446008)(66476007)(54906003)(6506007)(64756008)(8676002)(52536014)(2906002)(66946007)(316002)(4326008)(8936002)(38100700002)(110136005)(122000001)(7696005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnRUOGo5aTZGRjRibU1uMzBNS2xxZ2pnZWpEamZ5d3g2MHR5VkgvT296UVph?=
 =?utf-8?B?czRtRlNydDVOV05OQk9QZ2ZoR1JaaEVuc1dtaDJuQUFWSTRiaktRK20xL0xx?=
 =?utf-8?B?TmI0QS9PQXlYMUdJN1dNWDg0WlI4bVdqeVVna2xRMHV4eldHaGJUL3BVQnZC?=
 =?utf-8?B?UmoyNGdKeXl5Wlo1OG9rVXB3RXhMOTlPMGRIT0VNL3JDZVl6eWY0ekliUzlM?=
 =?utf-8?B?dGkxYnp5bXdtTHJodnVlWXVjaW93QUdHUTVxVW5SY3UySXRhTHFDSFRxOFMx?=
 =?utf-8?B?QXB3dFYzYXlJUTFmY2VhRjIxbkg4S3NQSW9vZ0d6OGlPanRZZ3NXWnVWT0Fi?=
 =?utf-8?B?WXhzNldZeU1BWklyWFJWenRBVlJuYS8zUVQ1cXNsWndIbTI0Vms5UjRXNld1?=
 =?utf-8?B?cVpMSlhuUW01cld5b0l3K21EcXVGV1NweGlEa0JuMlpYQlJjT0oycHVlTFpn?=
 =?utf-8?B?Ni9ocTN4R1JUT1lLcnBlcXZnV1Vucmo3U29MREo0bmpOM3ZFcmJPMEMveERZ?=
 =?utf-8?B?eHJ6aTlPc1hxcFlZVFZ0ZWpneEt0YkZPRCtXUmljSFpqQ0s1ZzIxbnlXQWFX?=
 =?utf-8?B?Znd6cDFCWHI3TUEwZ09PQXJpNzlqbGJsZUNqbEVFNHhHM0pwaHpjZlFVY01V?=
 =?utf-8?B?aTV1d0hGa1JQd0xHcHJNbDFQa2F2NGowVTFGcHlmU082T0xZdGU1Vk15bmow?=
 =?utf-8?B?OVoxRysyRWoyMmduam1MNEZ6c3htZzNYZlVEa0NRb1BLb05qMFFzS1FBSm8x?=
 =?utf-8?B?S203Q1dkTHdXTHdTaWpMd1BFSUY3a25VRmh1VVVHbFI0bE1OTXBURnZkNlUy?=
 =?utf-8?B?K0pMcmtSOTdtK0I5TlBvVmRZR2lYby8vbjZkOE5HREgvYlRYSzVjdU5lTzdj?=
 =?utf-8?B?cUp3NzB4QThKRE85ZFpWTjduUUZmWGM1RWZnMW9JMTBkZVZUYm1tVXRidHkv?=
 =?utf-8?B?N0VhbVpsTUJKY3BnbURJV2x5bTFEQTVBRGMwSHBVSUJucGJXT3hqcW9peHh1?=
 =?utf-8?B?azhwTjBFbytxNTdtbVpQNC8vV3k2emlxdlVzZ0pSYithK1g2V1FGUU1aQm1W?=
 =?utf-8?B?NCt5WjJ0Y2d1U3JSWklCaVlnbndTczVMNGF5RjJoZVZGRjB6UWFIK25ZUkNN?=
 =?utf-8?B?M1pXTm11K3hJN0NBRkpoSGJnN2pubDFGNWY3M0VYZ2ZKZm1JR2FUZzVLaGNH?=
 =?utf-8?B?Wk5JWDZ6WkFQVDY1NTE1N2YvNGN0MEpiblIzTTZLU05yWjZFSFFlMTBOMVZX?=
 =?utf-8?B?VVhoN3VMNXMybDVsNXZGS1J6L1Y5bnZ1UDFxZVdBeHNIenVtY1d0LzVNMDhm?=
 =?utf-8?B?ZiswY0YyVmt3bHBSd0tXUjZ4UE1CWjlSa3hSdU54TDlxMU5XdW5TRmxuY0FC?=
 =?utf-8?B?T3V3YUFqVCtycTdpKysvemV0TUdDOC9WNTZkcTlMYzN2QTJhT05wQ216d0ZN?=
 =?utf-8?B?SDlXNGFaaDRQejF4QnhLN05kbGVhZGN6UnBsbExmQWdkNzhjdFNMSGlCeFZD?=
 =?utf-8?B?SDlwTmJyMzdac1R4TjhyZjRtN2hydDZsQk50dW4wYVV3dDRwS1U3dU1uaS9H?=
 =?utf-8?B?SjVDTTJ3QVBDVHFIdzJlRStqWEdMVVloQ0Y1WnNIcm5sRXpjcm1EN1RnbUNw?=
 =?utf-8?B?MEp3eG1iV2VRNFdkUWtPSU9sVXFPbk8ybTZPQWk1SDhIYU5sV1BEaGpvTEl1?=
 =?utf-8?B?OG1kSzBWWjlHV0dITExYak0wekdqWVlMYlJUQjFETHN3NENsSCtFTFFJWjFv?=
 =?utf-8?B?MkVlRENPekhtSjF2dVFubGFDSEFMSC9vMGd1VGRkdGdES0ZwaFNhKzErcUdP?=
 =?utf-8?B?K3kzRWVmbFN1dTU0VkxJNzBBQStmVFFydXdPNVA0Z2Z0OVJGY215VkU5TmEr?=
 =?utf-8?B?dEdIUkNkcnRqMTlzVmNLM1owNFEvVGU2MXVyRGpHRnlmSG9TR1Bjc2ExM0RE?=
 =?utf-8?B?c2pnTjZmNFJhYWdNb085ay9BN25PUkovOTBtYXMrbkpQWmRDQmh1UXZnSTgz?=
 =?utf-8?B?SjFacG15VHZIUFlTQ0oxTXEvVUxIWFZ4cTIvVGZUeUE4Tk9vakxCTlpBVFN6?=
 =?utf-8?B?L1pSQVNLVnAySlF5WnRwUGhxK2Z1U0VkTUlwRTJLb1YycmJyM0crMHNVYUY4?=
 =?utf-8?Q?gJ5k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c18389-14c4-4ba2-0098-08dc266da115
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 17:12:27.5518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdWAqOwloixfzOjz8NXawOgo4TCEdN4CRG51j1mFOtEqqlQdv/u8ePaoPXnLhpX4vJiCkFPVGbKDuC4UVrpxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5407
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4g
U2hlbmd5dSBRdQ0KPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMywgMjAyNCA4OjA1IEFNDQo+
IFRvOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogd2lhZ24yMzNAb3V0bG9vay5jb207IENvcm53YWxs
LCBKYXkgPEpheS5Db3Jud2FsbEBhbWQuY29tPjsNCj4gS29lbmlnLCBDaHJpc3RpYW4gPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2aW4NCj4gPEFydW5w
cmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBkcm0vYW1ka2ZkOiBS
ZWxvY2F0ZSBUQkEvVE1BIHRvIG9wcG9zaXRlIHNpZGUgb2YgVk0gaG9sZSAodjIpDQo+DQo+IEhp
IEZlbGl4LA0KPiBTb3JyeSBmb3IgbXkgbGF0ZSByZXBseS4gSSB3YXMgYnVzeSB0aGlzIHdlZWsu
DQo+IEkganVzdCBkaWQgc29tZSBtb3JlIHRlc3RzIHVzaW5nIG5leHQtMjAyNDAyMDIgYnJhbmNo
LiBUZXN0aW5nIHVzaW5nIGJsZW5kZXINCj4gNC4wLjIsIHdoZW4gb25seSBvbmUgSElQIHJlbmRl
ciB0YXNrIGlzIHJ1bm5pbmcsIHRoZXJlJ3Mgbm8gcHJvYmxlbS4NCj4gSG93ZXZlciwgd2hlbiB0
d28gdGFza3MgcnVuIHRvZ2V0aGVyLCBzb2Z0d2FyZSBhbHdheXMgY3Jhc2hlcywgYnV0IG5vdA0K
PiBjcmFzaGVzIHRoZSB3aG9sZSBzeXN0ZW0uIERtZXNnIHJlcG9ydHMgZ3B1IHJlc2V0IGluIG1v
c3QgY2FzZXMsIGZvcg0KPiBleGFtcGxlOg0KPg0KPiBbICAxNzYuMDcxODIzXSBbZHJtOmFtZGdw
dV9qb2JfdGltZWRvdXQgW2FtZGdwdV1dICpFUlJPUiogcmluZw0KPiBnZnhfMC4wLjAgdGltZW91
dCwgc2lnbmFsZWQgc2VxPTMyNjA4LCBlbWl0dGVkIHNlcT0zMjYxMCBbICAxNzYuMDcyMDAwXQ0K
PiBbZHJtOmFtZGdwdV9qb2JfdGltZWRvdXQgW2FtZGdwdV1dICpFUlJPUiogUHJvY2Vzcw0KPiBp
bmZvcm1hdGlvbjogcHJvY2VzcyBibGVuZGVyIHBpZCA0MjU2IHRocmVhZCBibGVuZGVyOmNzMCBw
aWQgNDI5Nw0KPiBbICAxNzYuMDcyMTQzXSBhbWRncHUgMDAwMDowMzowMC4wOiBhbWRncHU6IEdQ
VSByZXNldCBiZWdpbiENCj4gWyAgMTc2LjA3MzU3MV0gYW1kZ3B1IDAwMDA6MDM6MDAuMDogYW1k
Z3B1OiBHdWlsdHkgam9iIGFscmVhZHkgc2lnbmFsZWQsDQo+IHNraXBwaW5nIEhXIHJlc2V0IFsg
IDE3Ni4wNzM1OTNdIGFtZGdwdSAwMDAwOjAzOjAwLjA6IGFtZGdwdTogR1BVDQo+IHJlc2V0KDQp
IHN1Y2NlZWRlZCENCj4NCj4gQW5kIGluIHNvbWUgcmFyZSBjYXNlcywgdGhlcmUgd291bGQgYmUg
YSBwYWdlIGZhdWx0IHJlcG9ydCwgc2VlIGRtZXNnLmxvZy4NCj4gRG8geW91IGhhdmUgYW55IGlk
ZWE/IENhbiBJIG1ha2UgaXQgcHJpbnQgbW9yZSBkZXRhaWxlZCBkaWFnbm9zdGljDQo+IGluZm9y
bWF0aW9uPw0KDQpBcmUgeW91IG9ubHkgc2VlaW5nIHRoZSBwcm9ibGVtIHdpdGggdGhpcyBwYXRj
aCBhcHBsaWVkIG9yIGluIGdlbmVyYWw/ICBJZiB5b3UgYXJlIHNlZWluZyBpdCBpbiBnZW5lcmFs
LCBpdCBsaWtlbHkgcmVsYXRlZCB0byBhIGZpcm13YXJlIGlzc3VlIHRoYXQgd2FzIHJlY2VudGx5
IGZpeGVkIHRoYXQgd2lsbCBiZSByZXNvbHZlZCB3aXRoIGFuIHVwZGF0ZSBDUCBmaXJtd2FyZSBp
bWFnZS4NCkRyaXZlciBzaWRlIGNoYW5nZXM6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvYWdkNWYvbGludXgvLS9jb21taXQvMGViNmM2NjRiNzgwZGQxYjQwODBlMDQ3YWQ1MWIxMDBj
ZDc4NDBhMw0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FnZDVmL2xpbnV4Ly0vY29t
bWl0LzQwOTcwZTYwMDcwZWQzZDEzOTBlYzY1ZTM4ZTgxOWY2ZDgxYjhmMGMNCg0KQWxleA0KDQoN
Cj4NCj4gQmVzdCByZWdhcmRzLA0KPiBTaGVuZ3l1DQo+DQo+DQo+IOWcqCAyMDI0LzEvMzAgMDE6
NDcsIEZlbGl4IEt1ZWhsaW5nIOWGmemBkzoNCj4gPiBPbiAyMDI0LTAxLTI5IDEwOjI0LCBTaGVu
Z3l1IFF1IHdyb3RlOg0KPiA+PiBIZWxsbyBGZWxpeCwNCj4gPj4gSSB0aGluayB5b3UgYXJlIHJp
Z2h0LiBUaGlzIHByb2JsZW0gaGFzIGV4aXN0ZWQgZm9yIHllYXJzKGp1c3QgbG9vaw0KPiA+PiBh
dCB0aGUgaXNzdWUgY3JlYXRpb24gdGltZSBpbiBteSBsaW5rKSwgYW5kIGlzIHRob3VnaHQgY2F1
c2VkIGJ5DQo+ID4+IE9wZW5HTC1ST0NNIGludGVyb3AodGhhdCdzIHdoeSBJIHRoaW5rIHRoaXMg
cGF0Y2ggbWlnaHQgaGVscCkuIEl0IGlzDQo+ID4+IHZlcnkgZWFzeSB0byB0cmlnZ2VyIHRoaXMg
cHJvYmxlbSBpbiBibGVuZGVyKG1ldGhvZCBpcyBhbHNvIG1lbnRpb25lZA0KPiA+PiBpbiB0aGUg
bGluaykuDQo+ID4NCj4gPiBUaGlzIGRvZXNuJ3QgaGVscCB5b3UsIGJ1dCBpdCdzIHVubGlrZWx5
IHRoYXQgdGhpcyBoYXMgYmVlbiB0aGUgc2FtZQ0KPiA+IGlzc3VlIGZvciB0d28geWVhcnMgZm9y
IGV2ZXJ5Ym9keSB3aG8gY2hpbWVkIGludG8gdGhpcyBidWcgcmVwb3J0Lg0KPiA+IERpZmZlcmVu
dCBrZXJuZWwgdmVyc2lvbnMsIEdQVXMsIHVzZXIgbW9kZSBST0NtIGFuZCBNZXNhIHZlcnNpb25z
IGV0Yy4NCj4gPg0KPiA+IENhc2UgaW4gcG9pbnQsIGl0J3MgcG9zc2libGUgdGhhdCB5b3UncmUg
c2VlaW5nIGFuIGlzc3VlIHNwZWNpZmljIHRvDQo+ID4gUkROQTMsIHdoaWNoIGhhc24ndCBldmVu
IGJlZW4gYXJvdW5kIGZvciB0aGF0IGxvbmcuDQo+ID4NCj4gPg0KPiA+PiBEbw0KPiA+PiB5b3Ug
aGF2ZSBhbnkgaWRlYSBhYm91dCB0aGlzPw0KPiA+DQo+ID4gTm90IHdpdGhvdXQgc2VlaW5nIGEg
bG90IG1vcmUgZGlhZ25vc3RpYyBpbmZvcm1hdGlvbi4gQSBmdWxsIGJhY2t0cmFjZQ0KPiA+IGZy
b20geW91ciBrZXJuZWwgbG9nIHdvdWxkIGJlIGEgZ29vZCBzdGFydC4NCj4gPg0KPiA+IFJlZ2Fy
ZHMsDQo+ID4gICBGZWxpeA0KPiA+DQo+ID4NCj4gPj4gQmVzdCByZWdhcmRzLA0KPiA+PiBTaGVu
Z3l1DQo+ID4+IOWcqCAyMDI0LzEvMjkgMjI6NTEsIEZlbGl4IEt1ZWhsaW5nIOWGmemBkzoNCj4g
Pj4+IE9uIDIwMjQtMDEtMjkgODo1OCwgU2hlbmd5dSBRdSB3cm90ZToNCj4gPj4+PiBIaSwNCj4g
Pj4+PiBTZWVtcyByb2NtLW9wZW5nbCBpbnRlcm9wIGhhbmcgcHJvYmxlbSBzdGlsbCBleGlzdHNb
MV0uIEJ0dyBoYXZlDQo+ID4+Pj4geW91IGRpc2NvdmVyZWQgaW50byB0aGlzIHByb2JsZW0/DQo+
ID4+Pj4gQmVzdCByZWdhcmRzLA0KPiA+Pj4+IFNoZW5neXUNCj4gPj4+PiBbMV0NCj4gPj4+PiBo
dHRwczovL3Byb2plY3RzLmJsZW5kZXIub3JnL2JsZW5kZXIvYmxlbmRlci9pc3N1ZXMvMTAwMzUz
I2lzc3VlY29tDQo+ID4+Pj4gbWVudC0xMTExNTk5DQo+ID4+Pg0KPiA+Pj4gTWF5YmUgeW91J3Jl
IGhhdmluZyBhIGRpZmZlcmVudCBwcm9ibGVtLiBEbyB5b3Ugc2VlIHRoaXMgaXNzdWUgYWxzbw0K
PiA+Pj4gd2l0aG91dCBhbnkgdmVyc2lvbiBvZiB0aGUgIlJlbG9jYXRlIFRCQS9UTUEgLi4uIiBw
YXRjaD8NCj4gPj4+DQo+ID4+PiBSZWdhcmRzLA0KPiA+Pj4gICBGZWxpeA0KPiA+Pj4NCj4gPj4+
DQo+ID4+Pj4NCj4gPj4+PiDlnKggMjAyNC8xLzI3IDAzOjE1LCBTaGVuZ3l1IFF1IOWGmemBkzoN
Cj4gPj4+Pj4gSGVsbG8gRmVsaXgsDQo+ID4+Pj4+IFRoaXMgcGF0Y2ggc2VlbXMgd29ya2luZyBv
biBteSBzeXN0ZW0sIGFsc28gaXQgc2VlbXMgZml4ZXMgdGhlDQo+ID4+Pj4+IFJPQ00vT3BlbkdM
IGludGVyb3AgcHJvYmxlbS4NCj4gPj4+Pj4gSXMgdGhpcyBpbnRlbmRlZCB0byBoYXBwZW4gb3Ig
bm90PyBNYXliZSB3ZSBuZWVkIG1vcmUgdXNlcnMgdG8NCj4gPj4+Pj4gdGVzdCBpdC4NCj4gPj4+
Pj4gQmVzaWRlcywNCj4gPj4+Pj4gVGVzdGVkLWJ5OiBTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRs
b29rLmNvbT4gQmVzdCBSZWdhcmRzLA0KPiBTaGVuZ3l1DQo+ID4+Pj4+DQo+ID4+Pj4+IOWcqCAy
MDI0LzEvMjYgMDY6MjcsIEZlbGl4IEt1ZWhsaW5nIOWGmemBkzoNCj4gPj4+Pj4+IFRoZSBUQkEg
YW5kIFRNQSwgYWxvbmcgd2l0aCBhbiB1bnVzZWQgSUIgYWxsb2NhdGlvbiwgcmVzaWRlIGF0DQo+
ID4+Pj4+PiBsb3cgYWRkcmVzc2VzIGluIHRoZSBWTSBhZGRyZXNzIHNwYWNlLiBBIHN0cmF5IFZN
IGZhdWx0IHdoaWNoDQo+ID4+Pj4+PiBoaXRzIHRoZXNlIHBhZ2VzIG11c3QgYmUgc2VydmljZWQg
YnkgbWFraW5nIHRoZWlyIHBhZ2UgdGFibGUgZW50cmllcw0KPiBpbnZhbGlkLg0KPiA+Pj4+Pj4g
VGhlIHNjaGVkdWxlciBkZXBlbmRzIHVwb24gdGhlc2UgcGFnZXMgYmVpbmcgcmVzaWRlbnQgYW5k
IGZhaWxzLA0KPiA+Pj4+Pj4gcHJldmVudGluZyBhIGRlYnVnZ2VyIGZyb20gaW5zcGVjdGluZyB0
aGUgZmFpbHVyZSBzdGF0ZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBCeSByZWxvY2F0aW5nIHRoZXNl
IHBhZ2VzIGFib3ZlIDQ3IGJpdHMgaW4gdGhlIFZNIGFkZHJlc3Mgc3BhY2UNCj4gPj4+Pj4+IHRo
ZXkgY2FuIG9ubHkgYmUgcmVhY2hlZCB3aGVuIGJpdHMgWzYzOjQ4XSBhcmUgc2V0IHRvIDEuIFRo
aXMNCj4gPj4+Pj4+IG1ha2VzIGl0IG11Y2ggbGVzcyBsaWtlbHkgZm9yIGEgbWlzYmVoYXZpbmcg
cHJvZ3JhbSB0byBnZW5lcmF0ZQ0KPiA+Pj4+Pj4gYWNjZXNzZXMgdG8gdGhlbS4NCj4gPj4+Pj4+
IFRoZSBjdXJyZW50IHBsYWNlbWVudCBhdCBWQSAoUEFHRV9TSVpFKjIpIGlzIHJlYWRpbHkgaGl0
IGJ5IGENCj4gPj4+Pj4+IE5VTEwgYWNjZXNzIHdpdGggYSBzbWFsbCBvZmZzZXQuDQo+ID4+Pj4+
Pg0KPiA+Pj4+Pj4gdjI6DQo+ID4+Pj4+PiAtIE1vdmUgaXQgdG8gdGhlIHJlc2VydmVkIHNwYWNl
IHRvIGF2b2lkIGNvbmNmbGljdHMgd2l0aCBNZXNhDQo+ID4+Pj4+PiAtIEFkZCBtYWNyb3MgdG8g
bWFrZSByZXNlcnZlZCBzcGFjZSBtYW5hZ2VtZW50IGVhc2llcg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+
IENjOiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW0gPEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFt
ZC5jb20+DQo+ID4+Pj4+PiBDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmF5IENvcm53YWxsIDxqYXkuY29ybndh
bGxAYW1kLmNvbT4NCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxmZWxp
eC5rdWVobGluZ0BhbWQuY29tPg0KPiA+Pj4+Pj4gLS0tDQo+ID4+Pj4+PiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyAgICAgIHwgIDQgKy0tDQo+ID4+Pj4+PiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZXE2NC5jICAgIHwgIDcgKystLS0NCj4g
Pj4+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggICAgICAgfCAx
MiArKysrKystLQ0KPiA+Pj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZmxh
dF9tZW1vcnkuYyB8IDMwDQo+ID4+Pj4+PiArKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+Pj4+Pj4g
ICA0IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3NhLmMNCj4gPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzYS5jDQo+ID4+Pj4+PiBpbmRleCA4MjNkMzFmNGEyYTMuLjUzZDBhNDU4ZDc4ZSAxMDA2NDQN
Cj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYw0K
PiA+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jDQo+
ID4+Pj4+PiBAQCAtMjgsOSArMjgsOSBAQA0KPiA+Pj4+Pj4gICAgIHVpbnQ2NF90IGFtZGdwdV9j
c2FfdmFkZHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ID4+Pj4+PiAgIHsNCj4gPj4+
Pj4+IC0gICAgdWludDY0X3QgYWRkciA9IGFkZXYtPnZtX21hbmFnZXIubWF4X3BmbiA8PA0KPiA+
Pj4+Pj4gQU1ER1BVX0dQVV9QQUdFX1NISUZUOw0KPiA+Pj4+Pj4gKyAgICB1aW50NjRfdCBhZGRy
ID0gQU1ER1BVX1ZBX1JFU0VSVkVEX0NTQV9TVEFSVCgNCj4gPj4+Pj4+ICsgICAgICAgIGFkZXYt
PnZtX21hbmFnZXIubWF4X3BmbiA8PCBBTURHUFVfR1BVX1BBR0VfU0hJRlQpOw0KPiA+Pj4+Pj4g
ICAtICAgIGFkZHIgLT0gQU1ER1BVX1ZBX1JFU0VSVkVEX0NTQV9TSVpFOw0KPiA+Pj4+Pj4gICAg
ICAgYWRkciA9IGFtZGdwdV9nbWNfc2lnbl9leHRlbmQoYWRkcik7DQo+ID4+Pj4+PiAgICAgICAg
IHJldHVybiBhZGRyOw0KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9zZXE2NC5jDQo+ID4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9zZXE2NC5jDQo+ID4+Pj4+PiBpbmRleCAzZDBkNTYwODdkNDEuLjllNzY5ZWY1
MGYyZSAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9zZXE2NC5jDQo+ID4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfc2VxNjQuYw0KPiA+Pj4+Pj4gQEAgLTQ1LDExICs0NSw4IEBADQo+ID4+Pj4+PiAgICAq
Lw0KPiA+Pj4+Pj4gICBzdGF0aWMgaW5saW5lIHU2NCBhbWRncHVfc2VxNjRfZ2V0X3ZhX2Jhc2Uo
c3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gPj4+Pj4+ICphZGV2KQ0KPiA+Pj4+Pj4gICB7DQo+ID4+
Pj4+PiAtICAgIHU2NCBhZGRyID0gYWRldi0+dm1fbWFuYWdlci5tYXhfcGZuIDw8DQo+ID4+Pj4+
PiBBTURHUFVfR1BVX1BBR0VfU0hJRlQ7DQo+ID4+Pj4+PiAtDQo+ID4+Pj4+PiAtICAgIGFkZHIg
LT0gQU1ER1BVX1ZBX1JFU0VSVkVEX1RPUDsNCj4gPj4+Pj4+IC0NCj4gPj4+Pj4+IC0gICAgcmV0
dXJuIGFkZHI7DQo+ID4+Pj4+PiArICAgIHJldHVybiBBTURHUFVfVkFfUkVTRVJWRURfU0VRNjRf
U1RBUlQoDQo+ID4+Pj4+PiArICAgICAgICBhZGV2LT52bV9tYW5hZ2VyLm1heF9wZm4gPDwgQU1E
R1BVX0dQVV9QQUdFX1NISUZUKTsNCj4gPj4+Pj4+ICAgfQ0KPiA+Pj4+Pj4gICAgIC8qKg0KPiA+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5o
DQo+ID4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+ID4+
Pj4+PiBpbmRleCA2NjY2OThhNTcxOTIuLmYyM2I2MTUzZDMxMCAxMDA2NDQNCj4gPj4+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oDQo+ID4+Pj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiA+Pj4+Pj4gQEAgLTEz
NSwxMSArMTM1LDE5IEBAIHN0cnVjdCBhbWRncHVfbWVtX3N0YXRzOw0KPiA+Pj4+Pj4gICAjZGVm
aW5lIEFNREdQVV9JU19NTUhVQjAoeCkgKCh4KSA+PQ0KPiBBTURHUFVfTU1IVUIwX1NUQVJUICYm
ICh4KQ0KPiA+Pj4+Pj4gPCBBTURHUFVfTU1IVUIxX1NUQVJUKQ0KPiA+Pj4+Pj4gICAjZGVmaW5l
IEFNREdQVV9JU19NTUhVQjEoeCkgKCh4KSA+PQ0KPiBBTURHUFVfTU1IVUIxX1NUQVJUICYmICh4
KQ0KPiA+Pj4+Pj4gPCBBTURHUFVfTUFYX1ZNSFVCUykNCj4gPj4+Pj4+ICAgLS8qIFJlc2VydmUg
Mk1CIGF0IHRvcC9ib3R0b20gb2YgYWRkcmVzcyBzcGFjZSBmb3Iga2VybmVsIHVzZQ0KPiA+Pj4+
Pj4gKi8NCj4gPj4+Pj4+ICsvKiBSZXNlcnZlIHNwYWNlIGF0IHRvcC9ib3R0b20gb2YgYWRkcmVz
cyBzcGFjZSBmb3Iga2VybmVsIHVzZQ0KPiA+Pj4+Pj4gKyovDQo+ID4+Pj4+PiAgICNkZWZpbmUg
QU1ER1BVX1ZBX1JFU0VSVkVEX0NTQV9TSVpFICAgICAgICAoMlVMTCA8PCAyMCkNCj4gPj4+Pj4+
ICsjZGVmaW5lIEFNREdQVV9WQV9SRVNFUlZFRF9DU0FfU1RBUlQodG9wKSAgICAoKHRvcCkgXA0K
PiA+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAtIEFNREdQVV9WQV9SRVNFUlZFRF9D
U0FfU0laRSkNCj4gPj4+Pj4+ICAgI2RlZmluZSBBTURHUFVfVkFfUkVTRVJWRURfU0VRNjRfU0la
RSAgICAgICAgKDJVTEwgPDwgMjApDQo+ID4+Pj4+PiArI2RlZmluZSBBTURHUFVfVkFfUkVTRVJW
RURfU0VRNjRfU1RBUlQodG9wKQ0KPiA+Pj4+Pj4gKEFNREdQVV9WQV9SRVNFUlZFRF9DU0FfU1RB
UlQodG9wKSBcDQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgIC0gQU1ER1BVX1ZB
X1JFU0VSVkVEX1NFUTY0X1NJWkUpDQo+ID4+Pj4+PiArI2RlZmluZSBBTURHUFVfVkFfUkVTRVJW
RURfVFJBUF9TSVpFICAgICAgICAoMlVMTCA8PCAxMikgI2RlZmluZQ0KPiA+Pj4+Pj4gK0FNREdQ
VV9WQV9SRVNFUlZFRF9UUkFQX1NUQVJUKHRvcCkNCj4gPj4+Pj4+IChBTURHUFVfVkFfUkVTRVJW
RURfU0VRNjRfU1RBUlQodG9wKSBcDQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
IC0gQU1ER1BVX1ZBX1JFU0VSVkVEX1RSQVBfU0laRSkNCj4gPj4+Pj4+ICAgI2RlZmluZSBBTURH
UFVfVkFfUkVTRVJWRURfQk9UVE9NICAgICAgICAoMlVMTCA8PCAyMCkgLSNkZWZpbmUNCj4gPj4+
Pj4+IEFNREdQVV9WQV9SRVNFUlZFRF9UT1AgKEFNREdQVV9WQV9SRVNFUlZFRF9TRVE2NF9TSVpF
DQo+ICsgXA0KPiA+Pj4+Pj4gKyNkZWZpbmUgQU1ER1BVX1ZBX1JFU0VSVkVEX1RPUA0KPiAoQU1E
R1BVX1ZBX1JFU0VSVkVEX1RSQVBfU0laRSArIFwNCj4gPj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgQU1ER1BVX1ZBX1JFU0VSVkVEX1NFUTY0X1NJWkUgKyBcDQo+ID4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBBTURHUFVfVkFfUkVTRVJWRURfQ1NBX1NJWkUpDQo+ID4+
Pj4+PiAgICAgLyogU2VlIHZtX3VwZGF0ZV9tb2RlICovDQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMNCj4gPj4+Pj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMNCj4gPj4+Pj4+IGlu
ZGV4IDY2MDRhM2Y5OWM1ZS4uZjg5OWNjZTI1YjJhIDEwMDY0NA0KPiA+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMNCj4gPj4+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jDQo+ID4+Pj4+PiBA
QCAtMzYsNiArMzYsNyBAQA0KPiA+Pj4+Pj4gICAjaW5jbHVkZSA8bGludXgvbW0uaD4NCj4gPj4+
Pj4+ICAgI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4NCj4gPj4+Pj4+ICAgI2luY2x1ZGUgPGxpbnV4
L3Byb2Nlc3Nvci5oPg0KPiA+Pj4+Pj4gKyNpbmNsdWRlICJhbWRncHVfdm0uaCINCj4gPj4+Pj4+
ICAgICAvKg0KPiA+Pj4+Pj4gICAgKiBUaGUgcHJpbWFyeSBtZW1vcnkgSS9PIGZlYXR1cmVzIGJl
aW5nIGFkZGVkIGZvciByZXZpc2lvbnMgb2YNCj4gPj4+Pj4+IGdmeGlwIEBAIC0zMjYsMTAgKzMy
NywxNiBAQCBzdGF0aWMgdm9pZA0KPiA+Pj4+Pj4ga2ZkX2luaXRfYXBlcnR1cmVzX3ZpKHN0cnVj
dCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCwgdWludDhfdCBpZCkNCj4gPj4+Pj4+ICAgICAgICAq
IHdpdGggc21hbGwgcmVzZXJ2ZWQgc3BhY2UgZm9yIGtlcm5lbC4NCj4gPj4+Pj4+ICAgICAgICAq
IFNldCB0aGVtIHRvIENBTk9OSUNBTCBhZGRyZXNzZXMuDQo+ID4+Pj4+PiAgICAgICAgKi8NCj4g
Pj4+Pj4+IC0gICAgcGRkLT5ncHV2bV9iYXNlID0gU1ZNX1VTRVJfQkFTRTsNCj4gPj4+Pj4+ICsg
ICAgcGRkLT5ncHV2bV9iYXNlID0gbWF4KFNWTV9VU0VSX0JBU0UsDQo+ID4+Pj4+PiBBTURHUFVf
VkFfUkVTRVJWRURfQk9UVE9NKTsNCj4gPj4+Pj4+ICAgICAgIHBkZC0+Z3B1dm1fbGltaXQgPQ0K
PiA+Pj4+Pj4gcGRkLT5kZXYtPmtmZC0+c2hhcmVkX3Jlc291cmNlcy5ncHV2bV9zaXplIC0gMTsN
Cj4gPj4+Pj4+ICAgKyAgICAvKiBkR1BVczogdGhlIHJlc2VydmVkIHNwYWNlIGZvciBrZXJuZWwN
Cj4gPj4+Pj4+ICsgICAgICogYmVmb3JlIFNWTQ0KPiA+Pj4+Pj4gKyAgICAgKi8NCj4gPj4+Pj4+
ICsgICAgcGRkLT5xcGQuY3dzcl9iYXNlID0gU1ZNX0NXU1JfQkFTRTsNCj4gPj4+Pj4+ICsgICAg
cGRkLT5xcGQuaWJfYmFzZSA9IFNWTV9JQl9CQVNFOw0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gICAg
ICAgcGRkLT5zY3JhdGNoX2Jhc2UgPSBNQUtFX1NDUkFUQ0hfQVBQX0JBU0VfVkkoKTsNCj4gPj4+
Pj4+ICAgICAgIHBkZC0+c2NyYXRjaF9saW1pdCA9DQo+ID4+Pj4+PiBNQUtFX1NDUkFUQ0hfQVBQ
X0xJTUlUKHBkZC0+c2NyYXRjaF9iYXNlKTsNCj4gPj4+Pj4+ICAgfQ0KPiA+Pj4+Pj4gQEAgLTMz
OSwxOCArMzQ2LDE5IEBAIHN0YXRpYyB2b2lkIGtmZF9pbml0X2FwZXJ0dXJlc192OShzdHJ1Y3QN
Cj4gPj4+Pj4+IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkLCB1aW50OF90IGlkKQ0KPiA+Pj4+Pj4g
ICAgICAgcGRkLT5sZHNfYmFzZSA9IE1BS0VfTERTX0FQUF9CQVNFX1Y5KCk7DQo+ID4+Pj4+PiAg
ICAgICBwZGQtPmxkc19saW1pdCA9IE1BS0VfTERTX0FQUF9MSU1JVChwZGQtPmxkc19iYXNlKTsN
Cj4gPj4+Pj4+ICAgLSAgICAgICAgLyogUmF2ZW4gbmVlZHMgU1ZNIHRvIHN1cHBvcnQgZ3JhcGhp
YyBoYW5kbGUsIGV0Yy4NCj4gPj4+Pj4+IExlYXZlIHRoZSBzbWFsbA0KPiA+Pj4+Pj4gLSAgICAg
ICAgICogcmVzZXJ2ZWQgc3BhY2UgYmVmb3JlIFNWTSBvbiBSYXZlbiBhcyB3ZWxsLCBldmVuDQo+
ID4+Pj4+PiB0aG91Z2ggd2UgZG9uJ3QNCj4gPj4+Pj4+IC0gICAgICAgICAqIGhhdmUgdG8uDQo+
ID4+Pj4+PiAtICAgICAgICAgKiBTZXQgZ3B1dm1fYmFzZSBhbmQgZ3B1dm1fbGltaXQgdG8gQ0FO
T05JQ0FMIGFkZHJlc3Nlcw0KPiA+Pj4+Pj4gc28gdGhhdCB0aGV5DQo+ID4+Pj4+PiAtICAgICAg
ICAgKiBhcmUgdXNlZCBpbiBUaHVuayB0byByZXNlcnZlIFNWTS4NCj4gPj4+Pj4+IC0gICAgICAg
ICAqLw0KPiA+Pj4+Pj4gLSAgICAgICAgcGRkLT5ncHV2bV9iYXNlID0gU1ZNX1VTRVJfQkFTRTsN
Cj4gPj4+Pj4+ICsgICAgcGRkLT5ncHV2bV9iYXNlID0gQU1ER1BVX1ZBX1JFU0VSVkVEX0JPVFRP
TTsNCj4gPj4+Pj4+ICAgICAgIHBkZC0+Z3B1dm1fbGltaXQgPQ0KPiA+Pj4+Pj4gcGRkLT5kZXYt
PmtmZC0+c2hhcmVkX3Jlc291cmNlcy5ncHV2bV9zaXplIC0gMTsNCj4gPj4+Pj4+ICAgICAgICAg
cGRkLT5zY3JhdGNoX2Jhc2UgPSBNQUtFX1NDUkFUQ0hfQVBQX0JBU0VfVjkoKTsNCj4gPj4+Pj4+
ICAgICAgIHBkZC0+c2NyYXRjaF9saW1pdCA9DQo+ID4+Pj4+PiBNQUtFX1NDUkFUQ0hfQVBQX0xJ
TUlUKHBkZC0+c2NyYXRjaF9iYXNlKTsNCj4gPj4+Pj4+ICsNCj4gPj4+Pj4+ICsgICAgLyoNCj4g
Pj4+Pj4+ICsgICAgICogUGxhY2UgVEJBL1RNQSBvbiBvcHBvc2l0ZSBzaWRlIG9mIFZNIGhvbGUg
dG8gcHJldmVudA0KPiA+Pj4+Pj4gKyAgICAgKiBzdHJheSBmYXVsdHMgZnJvbSB0cmlnZ2VyaW5n
IFNWTSBvbiB0aGVzZSBwYWdlcy4NCj4gPj4+Pj4+ICsgICAgICovDQo+ID4+Pj4+PiArICAgIHBk
ZC0+cXBkLmN3c3JfYmFzZSA9IEFNREdQVV9WQV9SRVNFUlZFRF9UUkFQX1NUQVJUKA0KPiA+Pj4+
Pj4gKyAgICAgICAgcGRkLT5kZXYtPmFkZXYtPnZtX21hbmFnZXIubWF4X3BmbiA8PA0KPiA+Pj4+
Pj4gQU1ER1BVX0dQVV9QQUdFX1NISUZUKTsNCj4gPj4+Pj4+ICAgfQ0KPiA+Pj4+Pj4gICAgIGlu
dCBrZmRfaW5pdF9hcGVydHVyZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwcm9jZXNzKSBAQA0KPiA+
Pj4+Pj4gLTQwNywxMiArNDE1LDYgQEAgaW50IGtmZF9pbml0X2FwZXJ0dXJlcyhzdHJ1Y3Qga2Zk
X3Byb2Nlc3MNCj4gPj4+Pj4+ICpwcm9jZXNzKQ0KPiA+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4+Pj4gICAgICAgICAgICAgICAgICAgfQ0KPiA+Pj4+
Pj4gICAgICAgICAgICAgICB9DQo+ID4+Pj4+PiAtDQo+ID4+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgLyogZEdQVXM6IHRoZSByZXNlcnZlZCBzcGFjZSBmb3Iga2VybmVsDQo+ID4+Pj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICogYmVmb3JlIFNWTQ0KPiA+Pj4+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAqLw0KPiA+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
IHBkZC0+cXBkLmN3c3JfYmFzZSA9IFNWTV9DV1NSX0JBU0U7DQo+ID4+Pj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgcGRkLT5xcGQuaWJfYmFzZSA9IFNWTV9JQl9CQVNFOw0KPiA+Pj4+Pj4g
ICAgICAgICAgIH0NCj4gPj4+Pj4+ICAgICAgICAgICAgIGRldl9kYmcoa2ZkX2RldmljZSwgIm5v
ZGUgaWQgJXVcbiIsIGlkKTsNCj4gPj4+Pj4NCg==
